return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "thin", -- or "slant", "thick", "thin"
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      diagnostics = "nvim_lsp",
    },
  },
}
