return {
  {
    "neanias/everforest-nvim",
    opts = {
      priority = 1000,
    },
    config = function()
      require("everforest").setup({
        -- background = "soft",
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
