-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- EDITING
------------------------------------------------------------------------

-- Indents will have a width of 4 and use spaces instead of tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Key mappings
vim.api.nvim_set_keymap("i", "jj", "<esc>", { noremap = true })
