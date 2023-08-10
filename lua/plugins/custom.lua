return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search", },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search", },
    },
  },
  { "tanvirtin/monokai.nvim" },
  {
    "simrat39/rust-tools.nvim",
    keys = {
      { "<leader>rs", "<cmd>LspStart<cr>", desc = "LspStart" },
      { "<leader>rR", "<cmd>LspRestart<cr>", desc = "LspRestart" },
      { "<leader>rS", "<cmd>LspStop<cr>", desc = "LspStop" },
      { "<leader>rr", "<cmd>RustRunnables<cr>", desc = "RustRunnables" },
      { "<leader>rd", "<cmd>RustDebuggables<cr>", desc = "RustRunnables" },
    },
    opts = {
      server = {
        autostart = false,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              enable = false,
              command = "check",
              extraArgs = {},
            },
            procMacro = { enable = false },
            diagnostics = {
              enable = true,
              disabled = { "unresolved", "unresolved-proc-macro", "unresolved-macro-call" },
              enableExperimental = true,
            },
            cargo = {
              buildScripts = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
}
