-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- change trouble config
  -- {
  --   "folke/trouble.nvim",
  --   config = { use_diagnostic_signs = true },
  -- },

  -- add symbols-outline
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   cmd = "SymbolsOutline",
  --   keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  --   config = true,
  -- },

  -- add zen-mode
  -- {
  --   "folke/zen-mode.nvim",
  --   cmd = "ZenMode",
  --   config = true,
  --   keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  -- },

  -- use mini.starter instead of alpha
  -- { "goolord/alpha-nvim", enabled = false },
  -- { "echasnovski/mini.starter", enabled = true },
}
