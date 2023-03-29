return {
  "akinsho/toggleterm.nvim",
  config = function()
    local tt = require("toggleterm")
    tt.setup({
      size = 20,
      open_mapping = "<C-t>",
      direction = "float",
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    local lazygit_toggle = function()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>gg", lazygit_toggle, { noremap = true, silent = true, desc = "LazyGit" })
  end,
}
