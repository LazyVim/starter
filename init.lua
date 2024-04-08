-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- to copy from WSL2 ubuntu to Windows
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "/mnt/d/64/win32yank.exe -i --crlf",
    ["*"] = "/mnt/d/64/win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "/mnt/d/64/win32yank.exe -o --lf",
    ["*"] = "/mnt/d/64/win32yank.exe -o --lf",
  },
  cache_enabled = 0,
}
