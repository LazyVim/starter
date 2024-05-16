return {
  {
    "neanias/everforest-nvim",
    opts = {
      priority = 1000,
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
