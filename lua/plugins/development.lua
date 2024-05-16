return {
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    cmd = "Refactor",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
  },
}
