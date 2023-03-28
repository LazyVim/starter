return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    local mappings = {
      w = {
        h = { "<cmd>:wincmd h<cr>", "Jump left" },
        j = { "<cmd>:wincmd j<cr>", "Jump bottom" },
        k = { "<cmd>:wincmd k<cr>", "Jump up" },
        l = { "<cmd>:wincmd l<cr>", "Jump right" },
      },
    }

    wk.register(mappings, { mode = "n", prefix = "<leader>" })
    wk.register(mappings, { mode = "v", prefix = "<leader>" })
  end,
}
