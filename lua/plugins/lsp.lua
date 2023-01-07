return {

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    ---@type lspconfig.options
    servers = {
      jsonls = {},
      sumneko_lua = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    },
  },

  -- tools
  {
    "williamboman/mason.nvim",
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
  },
}
