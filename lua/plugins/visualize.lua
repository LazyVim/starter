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
  -- Disabled by conflict with neotree
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   lazy = true,
  --   event = "VeryLazy",
  --   opts = {
  --     render = "virtual",
  --     virtual_symbol = "",
  --     enable_tailwind = true,
  --   },
  -- },
  {
    "kevinhwang91/nvim-ufo",
    lazy = true,
    event = "VeryLazy",
  },
}
