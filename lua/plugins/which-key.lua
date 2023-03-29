return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local term = require("harpoon.term")

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
      h = {
        name = "Harpoon",
        a = { mark.add_file, "Add file" },
        h = { ui.toggle_quick_menu, "Toggle quick menu" },
        n = {
          function()
            ui.nav_next()
          end,
          "Navigate next",
        },
        p = {
          function()
            ui.nav_prev()
          end,
          "Navigate previous",
        },
        ["1"] = {
          function()
            ui.nav_file(1)
          end,
          "Navigate 1",
        },
        ["2"] = {
          function()
            ui.nav_file(2)
          end,
          "Navigate 2",
        },
        ["3"] = {
          function()
            ui.nav_file(3)
          end,
          "Navigate 3",
        },
        ["4"] = {
          function()
            ui.nav_file(4)
          end,
          "Navigate 4",
        },
        ["&"] = {
          function()
            ui.nav_file(1)
          end,
          "Navigate 1",
        },
        ["é"] = {
          function()
            ui.nav_file(2)
          end,
          "Navigate 2",
        },
        ['"'] = {
          function()
            ui.nav_file(3)
          end,
          "Navigate 3",
        },
        ["'"] = {
          function()
            ui.nav_file(4)
          end,
          "Navigate 4",
        },
      },
      c = {
        name = "Language",
        r = {
          function()
            vim.cmd([[Telescope lsp_references]])
          end,
          "Find references",
          remap = true,
        },
      },
    }

    wk.register(mappings, { mode = "n", prefix = "<leader>" })
    wk.register(mappings, { mode = "v", prefix = "<leader>" })
  end,
}
