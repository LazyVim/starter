-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local platform = require("lua.config.platform")
local current_platform = platform()
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakat = " ^I!@*-+;:,./?"
vim.opt.showbreak = "++"
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
vim.opt.undofile = true
vim.opt.autowriteall = true
vim.opt.swapfile = false
vim.opt.writebackup = true
vim.g.CheatSheetDisableFrameworkDetection = 0
if current_platform.is_mac or current_platform.is_linux then
  vim.g.ruby_host_prog = "$HOME/.local/share/mise/shims/ruby"
  vim.g.python_host_prog = "$HOME/.local/share/mise/shims/python3"
  vim.g.node_host_prog = "$HOME/.local/share/mise/shims/node"
elseif current_platform.is_win then
  vim.g.node_host_prog = "C:\\Users\\jtaylor\\AppData\\Local\\fnm_multishells\\6748_1721478808937\\node.exe"
  vim.g.python_host_prog = "C:\\Users\\jtaylor\\.pyenv\\pyenv-win\\shims\\python.bat"
  vim.g.ruby_host_prog = "C:\\Users\\jtaylor\\scoop\\apps\\ruby\\current\\bin\\ruby.exe"
end
