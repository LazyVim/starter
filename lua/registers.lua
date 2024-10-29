local M = {}

local chars = "abcdefghijklmnopqrstuvwxyz"

M.wipe_alpha = function()
  ---@type string[]
  local reg_chars = {}
  local _ = chars:gsub(".", function(v)
    table.insert(reg_chars, v)
  end)
  for _, v in pairs(reg_chars) do
    vim.fn.setreg(v, "")
  end
  vim.cmd.wshada({ bang = true })
end

return M
