return {
  -- Import the snacks explorer extra
  { import = "lazyvim.plugins.extras.editor.snacks_explorer" },

  -- Configure snacks.nvim
  {
    "folke/snacks.nvim",
    -- keys = {
    --   {
    --     "\\",
    --     function()
    --       Snacks.explorer()
    --     end,
    --     desc = "Toggle Snacks Explorer (Picker)",
    --   },
    --   { "<leader>e", false },
    -- },
    opts = {
      dashboard = {
        preset = {
          header = [[
 
████████╗███████╗███╗   ███╗ █████╗ ██╗     ██╗     ███████╗
╚══██╔══╝██╔════╝████╗ ████║██╔══██╗██║     ██║     ██╔════╝
   ██║   ███████╗██╔████╔██║███████║██║     ██║     ███████╗
   ██║   ╚════██║██║╚██╔╝██║██╔══██║██║     ██║     ╚════██║
   ██║   ███████║██║ ╚═╝ ██║██║  ██║███████╗███████╗███████║
   ╚═╝   ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝


          ]],
        },
      },
      scroll = {
        enabled = false, -- Disable scrolling animations
      },
      picker = {
        sources = {
          explorer = {
            hidden = false, -- Show hidden files by default
            layout = { preset = "right" }, -- Position on the right
            ignored = false,
            git_status = true, -- Show git status
            diagnostics = true, -- Show diagnostics
            follow_file = true, -- Follow current file
            win = {
              list = {
                keys = {
                  ["P"] = "toggle_preview", -- Custom key
                  ["L"] = function()
                    -- Get current line and try to extract file path
                    local line = vim.api.nvim_get_current_line()
                    local filepath = line:match("%s*(.-)%s*$") -- trim whitespace

                    if filepath and vim.fn.filereadable(filepath) == 1 then
                      local explorer_win = vim.api.nvim_get_current_win()
                      vim.cmd("wincmd p")
                      vim.cmd("edit " .. vim.fn.fnameescape(filepath))
                      vim.api.nvim_set_current_win(explorer_win)
                    end
                  end,
                },
              },
            },
          },
        },
      },
    },
  },
}
