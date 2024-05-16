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
    "dmmulroy/tsc.nvim",
    lazy = true,
    cmd = "TSC",
    opts = {
      use_trouble_qflist = true,
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
    config = function()
      require("telescope").load_extension("flutter")
    end,
  },
}
