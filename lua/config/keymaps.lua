-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

---- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor in middle when jumping
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Precognition
vim.keymap.set("n", "<leader>tp", require("precognition").toggle)

-- set the file picker to always open the cwd instead of root
vim.keymap.set("n", "<leader><leader>", function()
  require("lazyvim.util").pick("files", { root = false })()
end, { desc = "Find Files (cwd)" })

-- Markdown task management
require("config.markdown-tasks").setup()
