return {
  "vhyrro/luarocks.nvim",
  priority = 1000, -- We'd like this plugin to load first out of the rest
  config = true, -- This automatically runs `require("luarocks-nvim").setup()`
}
