return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup()
    end,
  },
}
