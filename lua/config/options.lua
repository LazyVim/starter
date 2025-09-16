-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Clipboard copy --
-- WSL clipboard copy
-- vim.g.clipboard = {
--   name = "wslclipboard",
--   copy = {
--     ["+"] = "wsl.exe clip.exe",
--     ["*"] = "wsl.exe clip.exe",
--   },
--   paste = {
--     ["+"] = "wsl.exe powershell.exe Get-Clipboard -Raw",
--     ["*"] = "wsl.exe powershell.exe Get-Clipboard -Raw",
--   },
--   cache_enabled = 0,
-- }
--   vim.opt.clipboard:append { 'unnamedplus' }

-- MAC OS Clipboard copy --
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.spell = true
