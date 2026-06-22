-- ~/.config/nvim/lua/plugins/mason.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
        pyright = {},
        yamlls = {},
        bashls = {},
      },
    },
  },
}
