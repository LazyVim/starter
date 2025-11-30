-- lua/plugins/markdown-spell.lua
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Desactivar el corrector ortográfico para Markdown
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.opt.spell = false
      end,
      desc = "Disable spell checking for Markdown files",
    })
  end,
}
