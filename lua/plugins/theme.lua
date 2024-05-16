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
    "brenoprata10/nvim-highlight-colors",
    lazy = true,
    event = "VeryLazy",
    opts = {},
  },
}
