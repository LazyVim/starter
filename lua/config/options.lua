-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options hereby

-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- Show line number
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
opt.colorcolumn = "0" -- Line lenght marker at 80 columns
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = false -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = false -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
function my_paste(reg)
  return function(lines)
    --[ 返回 “” 寄存器的内容，用来作为 p 操作符的粘贴物 ]
    local content = vim.fn.getreg('"')
    return vim.split(content, "\n")
  end
end
--
--if os.getenv("SSH_TTY") == nil then
--  --[ 当前环境为本地环境，也包括 wsl ]
--  opt.clipboard:append("unnamedplus")
--else
--  opt.clipboard:append("unnamedplus")
--  vim.g.clipboard = {
--    name = "OSC 52",
--    copy = {
--      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--    },
--    paste = {
--      --[ 小括号里面的内容可能是毫无意义的，但是保持原样可能看起来更好一点 ]
--      ["+"] = my_paste("+"),
--      ["*"] = my_paste("*"),
--    },
--  }
--end

if os.getenv("SSH_TTY") == nil then
  -- Local environment, including WSL
  vim.opt.clipboard = "unnamedplus"
else
  -- Use OSC52 for remote environment
  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = function(lines, _)
        require("osc52").copy(table.concat(lines, "\n"))
      end,
      ["*"] = function(lines, _)
        require("osc52").copy(table.concat(lines, "\n"))
      end,
    },
    paste = {
      ["+"] = function()
        return { vim.fn.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype("+") }
      end,
      ["*"] = function()
        return { vim.fn.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype("*") }
      end,
    },
  }
end
