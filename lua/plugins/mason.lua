-- ~/.config/nvim/lua/plugins/mason.lua
return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "yamlls",
        "bashls",
      },
    },
  },
}
