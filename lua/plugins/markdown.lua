return {
  {
    "opdavies/toggle-checkbox.nvim",
    lazy = true,
    ft = "markdown",
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "luarocks.nvim" },
    opts = {},
  },
}
