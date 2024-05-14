-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Global keymaps
map({ "n", "v" }, ";", ":", { desc = "Enter command mode", noremap = true, nowait = true })

-- File management Nvim
map("n", "<leader>op", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map({ "n", "i", "v" }, "<f12>", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })
map({ "n", "i", "v" }, "<F12>", function()
  vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })

-- Markdown configs
map("n", "<leader>ct", ":lua require('toggle-checkbox').toggle()<CR>", { desc = "Toggle Checkbox" })

-- Git configs
map("n", "<leader>gb", "<CMD>GitBlameToggle<CR>", { desc = "Toggle Git Blame" })
