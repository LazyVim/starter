return {

  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@param server string lsp server name
    ---@param opts _.lspconfig.options any options set for the server
    -- setup_server = function(server, opts)
    --   return false
    -- end,
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
