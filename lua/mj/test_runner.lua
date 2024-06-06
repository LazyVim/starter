local M = {}

local runner = require("mj.command_runner")

M.run_test_file = function()
  local current_path = vim.fn.expand("%")
  local cmd = "run_test " .. current_path
  runner.run_in_terminal(cmd, true)
end

M.test_line = function()
  local current_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local current_path = vim.fn.expand("%")
  local cmd = "run_test " .. current_path .. " --line=" .. current_line
  runner.run_in_terminal(cmd, true)
end

M.run_all_tests = function()
  local current_path = vim.fn.expand("%")
  local cmd = "run_test " .. current_path .. " --all"
  runner.run_in_terminal(cmd, true)
end

M.run_shell_test = function()
  runner.run_in_terminal("./shell_test", true)
end

M.run_rubocop = function()
  local file = vim.fn.expand("%")
  runner.run_in_terminal("bundle exec rubocop -A ", false)
end

return M
