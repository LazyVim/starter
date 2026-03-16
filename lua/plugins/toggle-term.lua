return {
  "akinsho/toggleterm.nvim",
  version = "*",

  keys = {
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Terminal" },
  },

  opts = {
    open_mapping = [[<leader>tt]],
    direction = "float",
    float_opts = { border = "rounded" },
    shell = (os.getenv("SHELL") or vim.fn.exepath("zsh") or vim.fn.exepath("bash")) .. " -l -i",
  },

  config = function(_, opts)
    require("toggleterm").setup(opts)
  end,
}
