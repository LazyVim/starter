if true then
  return {}
end

return {
  "m4xshen/autoclose.nvim",
  config = function()
    require("autoclose").setup()
  end,
}
