-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/jul-o/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group = vim.api.nvim_create_augroup("format_on_save", {}),
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })
