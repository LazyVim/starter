-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Global keymaps
map({ "n", "v" }, ";", ":", { desc = "Enter command mode", noremap = true, nowait = true })

-- Theme
map("n", "<leader>uh", "<CMD>HighlightColors Toggle<CR>", { desc = "Toggle highlighting color", nowait = true })

-- File management Nvim
map("n", "<leader>op", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Markdown configs
map("n", "<leader>ct", ":lua require('toggle-checkbox').toggle()<CR>", { desc = "Toggle Checkbox" })
map("n", "<leader>pb", ":lua require('gitpad').toggle_gitpad_branch()", { desc = "Toogle Gitpad branch" })
map("n", "<leader>pd", function()
  local date_filename = "daily-" .. os.date("%Y-%m-%d.md")
  require("gitpad").toggle_gitpad({ filename = date_filename }) -- or require('gitpad').toggle_gitpad({ filename = date_filename, title = 'Daily notes' })
end, { desc = "Toogle Gitpad Daily notes" })
map("n", "<leader>pf", function()
  local filename = vim.fn.expand("%:p") -- or just use vim.fn.bufname()
  if filename == "" then
    vim.notify("empty bufname")
    return
  end
  filename = vim.fn.pathshorten(filename, 2) .. ".md"
  require("gitpad").toggle_gitpad({ filename = filename }) -- or require('gitpad').toggle_gitpad({ filename = filename, title = 'Current file notes' })
end, { desc = "Toogle Gitpad per file notes" })

-- Git configs
map("n", "<leader>gb", "<CMD>GitBlameToggle<CR>", { desc = "Toggle Git Blame" })

-- Development config
map({ "n", "i", "v" }, "<f12>", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })
map({ "n", "i", "v" }, "<F12>", function()
  vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })
map("n", "<leader>rcf", "<CMD>Telescope flutter commands<CR>", { desc = "Run flutter" })
map("n", "<leader>rcs", "<CMD>lua require('csharp').debug_project()<CR>", { desc = "Debug C#" })
