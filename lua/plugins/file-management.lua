return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    opts = {
      float_opts = {
        border = "curved",
        title_pos = "left",
        width = 128,
        height = 16,
        row = 1,
      },
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
    },
  },
}
