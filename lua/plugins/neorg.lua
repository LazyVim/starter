-- local M = {
--   "nvim-neorg/neorg",
--   ft = "norg",
--   dependencies = {
--     "luarocks.nvim", -- this is it.
--     -- "nvim-treesitter/nvim-treesitter",
--     -- "nvim-treesitter/nvim-treesitter-textobjects",
--     -- "nvim-cmp",
--     -- "nvim-lua/plenary.nvim",
--   },
--   -- build = ":Neorg sync-parsers", -- and delete this line.
--   cmd = "Neorg",
-- }
-- local modules = {
--   ["core.defaults"] = {},
--   ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
--   ["core.integrations.nvim-cmp"] = {},
--   ["core.concealer"] = { config = { icon_preset = "diamond" } },
--   ["core.keybinds"] = {
--     -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
--     config = {
--       default_keybinds = true,
--       neorg_leader = "<Leader><Leader>",
--     },
--   },
--   ["core.dirman"] = {
--     config = {
--       workspaces = {
--         ["DE-parapente"] = "~/Documents/parapente/DE/cours",
--         ["Neorg-tuto"] = "~/Documents/Norg-Tutorial",
--       },
--     },
--   },
-- }
-- M.opts = {
--   load = modules,
-- }
-- return M

local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-cmp",
    "nvim-lua/plenary.nvim",
  },
  build = ":Neorg sync-parsers",
  cmd = "Neorg",
}
local modules = {
  ["core.defaults"] = {},
  ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
  ["core.integrations.nvim-cmp"] = {},
  ["core.export"] = {},
  ["core.export.markdown"] = { config = { extension = "all" } },
  ["core.concealer"] = { config = { icon_preset = "diamond" } },
  ["core.keybinds"] = {
    -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
    config = {
      default_keybinds = true,
      neorg_leader = "<Leader><Leader>",
    },
  },
  ["core.dirman"] = {
    config = {
      workspaces = {
        ["DE-parapente"] = "~/Documents/parapente/DE/cours",
        ["Neorg-tuto"] = "~/Documents/Norg-Tutorial",
      },
    },
  },
}
M.opts = {
  load = modules,
}
return M
