local opt = vim.opt
opt.tabstop = 4
opt.smartindent = true
opt.shiftwidth = 4
opt.expandtab = true
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      tabstop = 4,
      smartindent = true,
      shiftwidth = 4,
      expandtab = true,
    },
  },
}
