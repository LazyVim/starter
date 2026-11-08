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

      -- no project venv: fall back to the scratch kernel env
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
        return connect(state, o)
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
    end,
  },
}
