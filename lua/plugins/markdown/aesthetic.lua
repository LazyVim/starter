return {
  "OXY2DEV/markview.nvim",
  ft = "markdown",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("markview").setup()
  end,
}
