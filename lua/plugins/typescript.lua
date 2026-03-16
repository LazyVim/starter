return {
  -- disable vtsls
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = false,
        tsserver = false,
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },

  -- enable typescript-tools
  {
    "pmizio/typescript-tools.nvim",
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    opts = {
      settings = {
        tsserver_file_preferences = {
          disableSuggestions = false,
          includeInlayParameterNameHints = "all",
          includeCompletionsForModuleExports = true,
        },
        tsserver_enable_partial_semantic_mode = true,
        tsserver_watch_options = {
          watchFile = "useFsEvents", -- recommended for remote/container
          watchDirectory = "useFsEvents",
        },
      },
    },
  },
}
