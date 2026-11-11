-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
local opts = {
  noremap = true,
  silent = true,
}
map("n", "<C-p>", "<cmd>lua require('toggleterm').toggle()<CR>", opts)
map("n", "<C-n>", ":bn<cr>", opts)
map("n", "<C-m>", ":bp<cr>", opts)
map("n", "<C-d>", ":bd<cr>", opts)
