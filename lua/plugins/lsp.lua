return {

  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    ---@type lspconfig.options
    -- servers = {
    --   jsonls = {},
    --   sumneko_lua = {
    --     settings = {
    --       Lua = {
    --         workspace = {
    --           checkThirdParty = false,
    --         },
    --         completion = {
    --           callSnippet = "Replace",
    --         },
    --       },
    --     },
    --   },
    -- },
  },

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    -- ensure_installed = {
    --   "stylua",
    --   "shellcheck",
    --   "shfmt",
    --   "flake8",
    -- },
  },
}
