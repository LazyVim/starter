local function apply_transparency()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "LineNr",
    "CursorLineNr",
    "EndOfBuffer",
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptBorder",
    "TelescopeResultsBorder",
    "TelescopePreviewBorder",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeWinSeparator",
    "NeoTreeEndOfBuffer",
    "Pmenu",
    "PmenuSel",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.cmd("colorscheme tokyonight") -- or your theme
        apply_transparency()
      end,
    },
  },

  -- Automatically re-apply transparency when UI elements refresh
  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    config = function()
      -- when floats open
      vim.api.nvim_create_autocmd("User", {
        pattern = {
          "SnacksPickerOpen",
          "SnacksPickerClose",
          "LazyVimFloat",
        },
        callback = apply_transparency,
      })

      -- when switching colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = apply_transparency,
      })
    end,
  },
}
