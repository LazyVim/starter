return {
  "mrjones2014/legendary.nvim",
  dependencies = "stevearc/dressing.nvim",
  keys = {
    { "<leader>,", vim.cmd.Legendary, desc = "Legendary" },
  },
  config = {
    which_key = { auto_register = true },
  },
}
