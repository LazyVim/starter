local NORMALIZE = [[
import json, sys
p = sys.argv[1]
with open(p, encoding="utf-8") as f:
    nb = json.load(f)
for c in nb.get("cells", []):
    if c.get("cell_type") == "code":
        c.setdefault("execution_count", None)
        c.setdefault("outputs", [])
with open(p, "w", encoding="utf-8") as f:
    f.write(json.dumps(nb, indent=1, sort_keys=True, ensure_ascii=False) + "\n")
]]

return {
  { "folke/snacks.nvim", opts = { image = { enabled = true } } },
  {
    "ajbucci/ipynb.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig", "folke/snacks.nvim" },
    opts = { shadow = { location = "workspace" } },
    config = function(_, opts)
      require("ipynb").setup(opts)

      -- no project venv: fall back to the scratch kernel env; run the kernel with cwd = notebook dir
      local kernel = require("ipynb.kernel")
      local connect = kernel.connect
      kernel.connect = function(state, o)
        if
          o
          and not o.python_path
          and not o.connection_file
          and not vim.fs.root(state.source_path, { ".venv", "venv", ".virtualenv", "env" })
        then
          o.python_path = vim.fn.expand("~/.local/share/jupyter-scratch/bin/python")
        end
        -- the bridge (and its kernel) inherit nvim's cwd; start it in the notebook dir instead
        local jobstart = vim.fn.jobstart
        local dir = vim.fn.fnamemodify(state.source_path, ":p:h")
        vim.fn.jobstart = function(cmd, jo)
          return jobstart(cmd, vim.tbl_extend("keep", jo or {}, { cwd = dir }))
        end
        local ok, ret = pcall(connect, state, o)
        vim.fn.jobstart = jobstart
        if not ok then
          error(ret, 0)
        end
        return ret
      end

      -- rewrite saved JSON in Jupyter's format (indent=1, sorted keys, trailing newline) to avoid diff churn
      local io_mod = require("ipynb.io")
      local write_ipynb = io_mod.write_ipynb
      io_mod.write_ipynb = function(path, cells, metadata)
        local ret = write_ipynb(path, cells, metadata)
        local r = vim.system({ vim.fn.exepath("python3"), "-I", "-c", NORMALIZE, path }):wait()
        if r.code ~= 0 then
          vim.notify(r.stderr, vim.log.levels.ERROR)
        end
        return ret
      end

      -- cells are concatenated into one shadow file: drop diagnostics for normal notebook patterns
      local ignore = {
        E402 = true,
        F704 = true,
        reportUnusedExpression = true,
        reportUnusedCallResult = true,
        reportDuplicateImport = true,
        reportMissingTypeStubs = true,
        reportMissingParameterType = true,
      }
      local set = vim.diagnostic.set
      vim.diagnostic.set = function(ns, bufnr, diagnostics, o)
        if vim.api.nvim_buf_get_name(bufnr):find("/.ipynb.nvim/", 1, true) then
          diagnostics = vim.tbl_filter(function(d)
            local code = d.code and tostring(d.code)
            return not (
              (code and (ignore[code] or vim.startswith(code, "reportUnknown")))
              or d.message:find("allowed only within async function", 1, true)
            )
          end, diagnostics)
        end
        return set(ns, bufnr, diagnostics, o)
      end
    end,
  },
}
