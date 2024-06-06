-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- better up/down
map("i", "jj", "<Esc>", { desc = "Go to normal mode" })
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })

local alternative_file = require("mj.alternate_file")

map("n", "<leader>ak", function()
  alternative_file.open("next", "--exists")
end, { desc = "Open next alternative file" })

map("n", "<leader>aj", function()
  alternative_file.open("prev", "--exists")
end, { desc = "Open previous alternative file" })

-- Import the map function from LazyVim
local map = LazyVim.safe_keymap_set

-- Key mappings
map("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Quit" })
map("n", "<leader>q", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>bdd", "<cmd>bdelete!<cr>", { desc = "Close buffer!" })
map("n", "<leader>bda", "<cmd>bufdo %bd!<cr>", { desc = "Close all buffers!" })

-- Notes
map("n", "<leader>et", ":e ~/.tmp/notes/", { desc = "Edit notes" })
map("n", "<leader>on", ":e ~/.tmp/notes/notes.md<cr>", { desc = "Open notes" })
map("n", "<leader>con", ":e ~/.tmp/notes/notes.md<cr>", { desc = "Open notes" })

map("n", "<leader>j", function()
  CloseTerminalBuffer(true)
end, { desc = "Close terminal buffer (true)" })
map("n", "<leader>k", function()
  CloseTerminalBuffer(false)
end, { desc = "Close terminal buffer (false)" })

-- Search mappings
map("n", "<leader>f", "/", { desc = "Search alias" })
map("n", "<leader>F", "<cmd>nohlsearch<cr>", { desc = "Remove search highlight" })

-- Alternative file
map("n", "<leader>af", "<c-^>", { desc = "Alternative file" })

-- Avoid arrow keys in command mode
map("c", "<C-h>", "<left>", { desc = "Move left" })
map("c", "<C-j>", "<down>", { desc = "Move down" })
map("c", "<C-k>", "<up>", { desc = "Move up" })
map("c", "<C-l>", "<right>", { desc = "Move right" })
map("c", "<C-x>", "<del>", { desc = "Delete" })

-- Alternative file navigation
map("n", "<leader>ak", function()
  alternative_file.open("next", "--exists")
end, { desc = "Next alternative file" })
map("n", "<leader>aj", function()
  alternative_file.open("prev", "--exists")
end, { desc = "Previous alternative file" })

-- Diagnostic config
vim.diagnostic.config({ virtual_text = false })

-- Running tests
map("n", "<Leader>T", ":lua RunTestFile()<CR>", { desc = "Run test file" })
map("n", "<Leader>t", ":lua RunTestLineByLine()<CR>", { desc = "Run test for current line" })
map("n", "<Leader>at", ":lua RunAllTests()<CR>", { desc = "Run all tests" })
map("n", "s.t", ":lua RunShellTest()<CR>", { desc = "Run ./shell_test" })
