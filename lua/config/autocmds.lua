-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/jul-o/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.html", "*.tsx", "*.jsx" },
  callback = function(_)
    vim.cmd("InlineFoldToggle")
  end,
})
