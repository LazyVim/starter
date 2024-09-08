return {
  "ellisonleao/dotenv.nvim",
  config = function()
    require("dotenv").setup({
      enabled_on_load = true,
      verbose = false,
    })
  end,
}
