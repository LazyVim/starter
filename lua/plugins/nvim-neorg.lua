return {
  "nvim-neorg/neorg",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neorg/neorg-telescope",
  },
  build = ":Neorg sync-parsers",
  ft = "norg",
  cmd = "Neorg",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
        ["core.integrations.telescope"] = {},
      },
    })
  end,
}
