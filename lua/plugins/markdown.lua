return {
  {
    "opdavies/toggle-checkbox.nvim",
    lazy = true,
    ft = "markdown",
  },
  {
    "yujinyuz/gitpad.nvim",
    lazy = true,
    opts = {
      title = "Note",
      border = "rounded",
      dir = "~/Workspace/Notes/",
    },
  },
  {
    "jmbuhr/otter.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "hrsh7th/nvim-cmp", -- optional, for completion
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
