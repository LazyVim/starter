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
      t = {
        t = { "<cmd>Neotree toggle<cr>", "Toggle" },
      },
      b = {
        name = "Buffer",
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        l = { "<cmd>BufferLineCyclePrev<cr>", "Next" },
        L = { "<cmd>BufferLineMoveNext<cr>", "Next" },
        h = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        H = { "<cmd>BufferLineMovePrev<cr>", "Previous" },
        p = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
        q = {
          function()
            require("mini.bufremove").delete(0, false)
          end,
          "Close",
        },
        d = { "<cmd><cr>", "which_key_ignore" },
      },
    }

    wk.register(mappings, { mode = "n", prefix = "<leader>" })
    wk.register(mappings, { mode = "v", prefix = "<leader>" })
  end,
}
