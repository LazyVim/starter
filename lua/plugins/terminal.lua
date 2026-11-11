return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      direction = "float",
    })
  end,
}
