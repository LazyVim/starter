return {
  "ThePrimeagen/harpoon",
  config = function()
    local ui = require("harpoon.ui")

    require("harpoon").setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 24,
      },
      global_settings = {
        mark_branch = true,
      },
    })

    vim.keymap.set("n", "<C-c>", function()
      ui.nav_next()
    end, { desc = "Navigate next" })
  end,
}
