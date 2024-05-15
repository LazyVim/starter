return {
  {
    "opdavies/toggle-checkbox.nvim",
    lazy = true,
    event = "VeryLazy",
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
    dependencies = { "luarocks.nvim" },
    config = function()
      -- ...
    end,
  },
}
