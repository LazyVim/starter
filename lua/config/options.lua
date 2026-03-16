-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.o.scrolloff = 10

-- Semantic highlighting
vim.g.lazyvim_semantic_highlighting = false
vim.g.lazyvim_prettier_needs_config = false

-- Kill any orphaned tsserver processes when Neovim exits
vim.api.nvim_create_autocmd("ExitPre", {
  callback = function()
    vim.fn.system("pkill -f 'tsserver.js'")
  end,
})

-- Leave ai completion to copilot
vim.g.ai_cmp = false
