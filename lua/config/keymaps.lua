-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function ToggleExpandTab()
    local current_setting = vim.opt.expandtab:get()
    vim.opt.expandtab = not current_setting
    if vim.opt.expandtab:get() then
        print("<C-t>: Spaces Enabled")
    else
        print("<C-t>: Tabs Enabled")
    end
end

vim.api.nvim_set_keymap('n', '<C-t>', ':lua ToggleExpandTab()<CR>', { noremap = true, silent = true })

function ShowExpandTabStatus()
    if vim.opt.expandtab:get() then
        print("<C-t>: Spaces Enabled")
    else
        print("<C-t>: Tabs Enabled")
    end
end

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Delay the function call by 1000 milliseconds (1 second)
vim.defer_fn(ShowExpandTabStatus, 1000)


