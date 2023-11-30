return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "abecodes/tabout.nvim" },
    keys = {
      {
        "<tab>",
        function()
          return "<Plug>(Tabout)" or (require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next") or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
    },
  },
  {
    "abecodes/tabout.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
    },
    event = "InsertEnter",
    config = true,
  },
}
