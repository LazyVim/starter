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
      { "s", mode = { "n", "x", "o" }, "s", desc = "", },
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
      },
    },
  },
  {
   "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = false,
              },
              -- Add clippy lints for Rust.
              checkOnSave = {
                allFeatures = true,
                command = "check",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = false,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
      },
    }
  }
}
