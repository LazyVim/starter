local utils = require("user.utils")

vim.ui.select({ "apple", "banana", "mango" }, {
  prompt = "Title",
  telescope = require("telescope.themes").get_cursor(),
}, function(selected) end)
