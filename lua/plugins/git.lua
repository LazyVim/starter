return {
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      -- Override LazyVim Git Blame popup with inline toggle
      {
        "<leader>tb",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
        desc = "Toggle Inline Blame",
      },
    },
  },
}
