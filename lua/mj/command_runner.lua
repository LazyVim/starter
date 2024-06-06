M = {}

M.run = function(cmd)
  print("cmd: " .. cmd)
  local f = io.popen(cmd)
  local s = f:read('*a')
  f:close()
  return s
end


M.run_in_terminal = function(cmd, open_new_tab)
  if open_new_tab then
    vim.cmd('tabnew')
    -- vim.cmd('tabnext')
  end

  print("cmd: " .. cmd)
  vim.api.nvim_command(":terminal time " .. cmd)
end

return M
