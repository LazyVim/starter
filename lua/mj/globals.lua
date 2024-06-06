local M = {}

local runner = require("mj.command_runner")

function RunInTerminal(cmd, open_new_tab)
  runner.run_in_terminal(cmd, open_new_tab)
end

function RunTestFile()
  local current_path = vim.fn.expand("%")
  local cmd = "run_test " .. current_path
  RunInTerminal(cmd, true)
end

function RunTestLineByLine()
  local current_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local current_path = vim.fn.expand("%")
  local cmd = "run_test " .. current_path .. " --line=" .. current_line
  RunInTerminal(cmd, true)
end

function RunAllTests()
  local current_path = vim.fn.expand("%")
  local cmd = "run_test " .. current_path .. " --all"
  RunInTerminal(cmd, true)
end

function CloseTerminalBuffer(new_tab)
  local name = vim.api.nvim_buf_get_name(0)

  if string.find(name, "term://") then
    if not new_tab then
      local number = vim.api.nvim_buf_get_number(0)
      vim.api.nvim_exec("buffer #", true)
      vim.api.nvim_buf_delete(number, { force = true })
      return
    end

    vim.api.nvim_command("bdelete!")
  end
end

function RunShellTest()
  RunInTerminal("./shell_test", true)
end

function RunRubocop()
  local file = vim.fn.expand("%")
  RunInTerminal("bundle exec rubocop -A " .. file, false)
end
