-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Sync native editor registers with your system clipboard
vim.opt.clipboard = "unnamedplus"

-- Disable all legacy external language providers to boost startup speed
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider  = 0 -- Disables legacy Python 2 check
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_ruby_provider    = 0

