return {
  {
    "neanias/everforest-nvim",
    opts = {
      background = "medium",
    },
    config = function() end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    opts = {
      render = "virtual",
      virtual_symbol = "",
      enable_tailwind = true,
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPre",
  },
}
