return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        lazy = true,
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          Snacks.util.lsp.on({ name = "copilot" }, function()
            copilot_cmp._on_insert_enter({})
          end)
        end,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 1,
        priority = 100,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      local colors = {
        [""] = { fg = Snacks.util.color("Special") },
        ["Normal"] = { fg = Snacks.util.color("Special") },
        ["Warning"] = { fg = Snacks.util.color("DiagnosticError") },
        ["InProgress"] = { fg = Snacks.util.color("DiagnosticWarn") },
      }
      table.insert(opts.sections.lualine_x, 2, {
        function()
          local icon = LazyVim.config.icons.kinds.Copilot
          local status = require("copilot.status").data
          return icon .. (status.message or "")
        end,
        cond = function()
          if not package.loaded["copilot"] then
            return
          end
          local clients = vim.lsp.get_clients({ name = "copilot", bufnr = 0 })
          return #clients > 0
        end,
        color = function()
          if not package.loaded["copilot"] then
            return
          end
          local status = require("copilot.status").data
          return colors[status.status] or colors[""]
        end,
      })
    end,
  },
}
