return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local term = require("harpoon.term")

    local newMappings = {
      mode = { "n", "v" },
      { "<leader>w", group = "Window" },
      { "<leader>wh", "<cmd>:wincmd h<cr>", desc = "Jump left" },
      { "<leader>wj", "<cmd>:wincmd j<cr>", desc = "Jump bottom" },
      { "<leader>wk", "<cmd>:wincmd k<cr>", desc = "Jump up" },
      { "<leader>wl", "<cmd>:wincmd l<cr>", desc = "Jump right" },
      { "<leader>t", group = "Neotree" },
      { "<leader>tt", "<cmd>Neotree toggle<cr>", desc = "Toggle" },
      { "<leader>b", group = "Buffer" },
      { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
      { "<leader>bl", "<cmd>BufferLineCyclePrev<cr>", desc = "Next" },
      { "<leader>bL", "<cmd>BufferLineMoveNext<cr>", desc = "Next" },
      { "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
      { "<leader>bH", "<cmd>BufferLineMovePrev<cr>", desc = "Previous" },
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      {
        "<leader>bq",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Close buffer",
      },
      { "<leader>h", group = "Harpoon" },
      { "<leader>ha", mark.add_file, desc = "Add file" },
      { "<leader>hh", ui.toggle_quick_menu, desc = "Toggle quick menu" },
      {
        "<leader>hn",
        function()
          ui.nav_next()
        end,
        desc = "Navigate next",
      },
      {
        "<leader>hp",
        function()
          ui.nav_prev()
        end,
        desc = "Navigate previous",
      },
      {
        "<leader>h1",
        function()
          ui.nav_file(1)
        end,
        desc = "Navigate 1",
      },
      {
        "<leader>h2",
        function()
          ui.nav_file(2)
        end,
        desc = "Navigate 2",
      },
      {
        "<leader>h3",
        function()
          ui.nav_file(3)
        end,
        desc = "Navigate 3",
      },
      {
        "<leader>h4",
        function()
          ui.nav_file(4)
        end,
        desc = "Navigate 4",
      },
      {
        "<leader>h&",
        function()
          ui.nav_file(1)
        end,
        desc = "Navigate 1",
      },
      {
        "<leader>hé",
        function()
          ui.nav_file(2)
        end,
        desc = "Navigate 2",
      },
      {
        '<leader>h"',
        function()
          ui.nav_file(3)
        end,
        desc = "Navigate 3",
      },
      {
        "<leader>h'",
        function()
          ui.nav_file(4)
        end,
        desc = "Navigate 4",
      },
      { "<leader>c", group = "Language" },
      {
        "<leader>cr",
        function()
          vim.cmd([[Telescope lsp_references]])
        end,
        desc = "Find references",
        -- remap = true,
      },
    }

    local mappingsz = {
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

    wk.add(newMappings)

    -- wk.add(mappings, { mode = "n", prefix = "<leader>" })
    -- wk.add(mappings, { mode = "v", prefix = "<leader>" })
  end,
}
