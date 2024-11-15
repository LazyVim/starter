-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/jul-o/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "<leader>w", "<C-G> <C-W>")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.api.nvim_set_keymap("n", "<leader>w", "<C-G> <C-W>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-e>", "<Plug>(coc-snippets-expand)", { noremap = true, silent = true })

vim.keymap.set("i", "<C-Tab>", vim.fn["codeium#Accept"], { expr = true })
vim.keymap.set("i", "<C-,>", vim.fn["codeium#Complete"], { expr = true })

vim.keymap.set("i", "jh", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", ";", ":w<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-c>", function()
  require("harpoon.ui").nav_prev()
end, { silent = true, noremap = true })
vim.keymap.set("n", "<C-v>", function()
  require("harpoon.ui").nav_next()
end, { silent = true, noremap = true })
