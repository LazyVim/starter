return {
  "ziontee113/icon-picker.nvim",
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })

    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
    vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
    vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
  end,
}
