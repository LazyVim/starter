return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
    end
  end,
  setup = {
    autotag = {
      enable = true,
    },
  },
  -- opts = {
  --   autotag = {
  --     enable = true,
  --   },
  -- },
  dependencies = {
    { "windwp/nvim-ts-autotag" },
  },
}
