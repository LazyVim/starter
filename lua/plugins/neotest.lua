return {
  { "nvim-neotest/neotest-plenary" },
  { "rcasia/neotest-java" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = { adapters = { "neotest-plenary", "neotest-java" } },
  },
}
