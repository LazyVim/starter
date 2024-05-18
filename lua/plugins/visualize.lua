return {
  {
    "neanias/everforest-nvim",
    lazy = true,
    opts = {
      background = "medium",
    },
    config = function() end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    event = "VeryLazy",
    opts = {
      tailwind = true,
    },
  },
}
