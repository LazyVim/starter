return {
  -- Misc
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    cmd = "Refactor",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- TS / JS
  {
    "dmmulroy/tsc.nvim",
    lazy = true,
    cmd = "TSC",
    opts = {
      use_trouble_qflist = true,
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    lazy = true,
    event = "LazyFile",
    ft = { "ts", "tsx" },
  },
  -- C#
  {
    "iabdelkareem/csharp.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "Tastyep/structlog.nvim",
    },
  },
  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("flutter")
    end,
  },
}
