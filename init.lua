-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- init.lua
local lspconfig = require("lspconfig")

-- Setup Ruby Language Server
lspconfig.ruby_ls.setup({
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  settings = {
    ruby = {
      diagnostics = true,
      completion = true,
    },
  },
})

-- Setup Solargraph
lspconfig.solargraph.setup({
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
})
