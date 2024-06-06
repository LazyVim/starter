local M = {}

M.close_terminal_buffer = function(new_tab)
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

return M
