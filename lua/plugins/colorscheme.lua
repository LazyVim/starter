return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   lazy = true,
  --   config = true,
  --   opts = {
  --     terminal_colors = false,
  --   },
  --
  -- },
  {
    "morhetz/gruvbox",
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opt = function()
      return {
        transparent = true,
      }
    end,
  },
}
