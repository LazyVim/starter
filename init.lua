-- bootstrap lazy.nvim, LazyVim and your plugins
vim.o.autoread = true
vim.o.updatetime = 250

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
})

require("config.lazy")
