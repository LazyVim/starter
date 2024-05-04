return {
  -- Color Scheme
  'catppuccin/nvim',
  config = function()
    -- Apply colorScheme
    vim.cmd('colorscheme catppuccin-mocha')

    -- Transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}
