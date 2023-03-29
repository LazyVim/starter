return {
  "kosayoda/nvim-lightbulb",
  dependencies = "antoinemadec/FixCursorHold.nvim",
  config = function()
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]])
  end,
}
