-- ~/.config/nvim/lua/plugins/mason.lua
return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
	lua_ls = {},
	yamlls = {},
	bashls = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "lua_ls",
        "yamlls",
        "bashls",
      },
    },
  }
}

