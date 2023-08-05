-- NOTE: colorscheme
return {
  { "ellisonleao/gruvbox.nvim" },
  { "Mofiqul/dracula.nvim", name = "dracula" },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
