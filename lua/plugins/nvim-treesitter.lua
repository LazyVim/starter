return {
  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<C-t>", desc = "Increment Selection" },
      { "<bs>",  desc = "Decrement Selection", mode = "x" },
    },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-t>",
          node_incremental = "<C-t>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
}
