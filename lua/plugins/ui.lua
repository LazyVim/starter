return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
    cmd = "ToggleTerm",
    keys = { { "<leader>ct", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" } },
  },
  { "christoomey/vim-tmux-navigator" },
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
}
