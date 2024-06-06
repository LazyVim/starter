local M = {}

local runner = require("mj.command_runner")

function RunInTerminal(cmd, open_new_tab)
  runner.run_in_terminal(cmd, open_new_tab)
end

function RunShellTest()
  RunInTerminal("./shell_test", true)
end

function RunRubocop()
  local file = vim.fn.expand("%")
  RunInTerminal("bundle exec rubocop -A " .. file, false)
end

return M
