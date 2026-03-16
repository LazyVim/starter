return {
  "coder/claudecode.nvim",
  lazy = false,
  dependencies = { "folke/snacks.nvim" },
  opts = {
    log_level = "info",
    focus_after_send = true,
    terminal = {
      git_repo_cwd = true,
      -- split_side = "left",
      -- split_width_percentage = 0.25,
      -- provider = "toggleterm", -- "snacks" or "toggleterm"...
      -- auto_close = true,
      snacks_win_opts = {
        -- Floating window options
        position = "float",
        width = 0.85,
        height = 0.85,
        border = "rounded",
        keys = {
          hide = {
            "<leader>jj",
            function(self)
              self:hide()
            end,
            mode = "t",
            desc = "Hide Claude",
          },
        },
      },
    },
  },
  keys = {
    { "<leader>j", nil, desc = "Claude Code" },
    -- { "<C-/>", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" }, -- not working
    { "<leader>jj", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>jb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>js", "<cmd>ClaudeCodeSend<cr>", mode = { "n", "v" }, desc = "Send selection / file" },

    -- I use snacks_picker_list, not supported yet. Claude Code currently only supports these 5.
    -- {
    --   "<leader>js",
    --   "<cmd>ClaudeCodeTreeAdd<cr>",
    --   desc = "Add file",
    --   ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    -- },
    { "<leader>jr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume session" },
    { "<leader>jc", "<cmd>ClaudeCode --continue<cr>", desc = "Continue session" },
    { "<leader>jm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },

    -- Diff actions
    { "<leader>ja", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>jd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
