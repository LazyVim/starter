return {

  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    -- ---@class PluginLspOpts
    -- opts = {
    --   ---@type lspconfig.options
    --   servers = {
    --     jsonls = {},
    --     sumneko_lua = {
    --       settings = {
    --         Lua = {
    --           workspace = {
    --             checkThirdParty = false,
    --           },
    --           completion = {
    --             callSnippet = "Replace",
    --           },
    --         },
    --       },
    --     },
    --   },
    --   -- you can do any additional lsp server setup here
    --   -- return true if you don't want this server to be setup with lspconfig
    --   ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    --   setup = {
    --     -- example to setup with typescript.nvim
    --     -- tsserver = function(_, opts)
    --     --   require("typescript").setup({ server = opts })
    --     --   return true
    --     -- end,
    --     -- Specify * to use this function as a fallback for any server
    --     -- ["*"] = function(server, opts) end,
    --   },
    -- },
  },

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    -- opts = {
    --   ensure_installed = {
    --     "stylua",
    --     "shellcheck",
    --     "shfmt",
    --     "flake8",
    --   },
    -- },
  },
}
