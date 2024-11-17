-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- Primeongen keymaps (with system clipboard sync though)
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Do not cut on paste" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Do not cut on delete" })
vim.keymap.set({ "n", "v" }, "<leader>D", '"_D', { desc = "Do not cut on delete" })

-- VSCode keymaps
if vim.g.vscode then
    -- VSCode actions
    map("n", "<leader>cr", function()
        local code = require('vscode')
        code.action('editor.action.rename')
    end, { desc = "Rename Symbol" })

    -- Lazy Git
    map("n", "<leader>g", function()
        local code = require('vscode')
        code.action('lazygit-vscode.toggle')
    end, { desc = "Lazy git (cwd)" })
    unmap("n", "<leader>gg")
    unmap("n", "<leader>gG")
    unmap("n", "<leader>gb")
    unmap("n", "<leader>gB")
    unmap("n", "<leader>gf")
    unmap("n", "<leader>gl")
end
