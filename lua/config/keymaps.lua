-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Oil Nvim
map("n", "<leader>op", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Markdown related
map("n", "<leader>ct", ":lua require('toggle-checkbox').toggle()<CR>", { desc = "Toggle Checkbox" })
