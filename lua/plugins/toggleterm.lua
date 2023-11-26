return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      -- horizontal bash
      { "<leader>th", "<cmd>lua TermToggleBash('horizontal')<cr>", desc = "H-Bash" },
      {
        "<a-1>",
        mode = { "n", "v", "t" },
        "<cmd> lua TermToggleBash('horizontal')<cr>",
        desc = "H-Bash",
      },
      -- float bash
      { "<leader>tf", "<cmd>lua TermToggleBash('float')<cr>", desc = "Bash" },
      {
        "<a-2>",
        mode = { "n", "v", "t" },
        "<cmd> lua TermToggleBash('float')<cr>",
        desc = "Bash",
      },
      -- containers
      { "<leader>tc", "<cmd>lua TermToggleContainer('float')<cr>", desc = "Container" },
      { "<a-3>", mode = { "n", "x", "o", "t" }, "<cmd>lua TermToggleContainer('float')<cr>", desc = "Container" },
      -- ssh
      { "<leader>ts", "<cmd>lua TermToggleSsh('float')<cr>", desc = "ssh" },
      { "<a-4>", mode = { "n", "x", "o", "t" }, "<cmd>lua TermToggleSsh('float')<cr>", desc = "ssh" },
      -- python
      { "<leader>tp", "<cmd>lua TermTogglePython('float')<cr>", desc = "Python" },
      { "<a-5>", mode = { "n", "x", "o", "t" }, "<cmd>lua TermTogglePython('float')<cr>", desc = "Python" },
      -- node
      { "<leader>tn", "<cmd>lua TermToggleNode('float')<cr>", desc = "Node" },
      { "<a-6>", mode = { "n", "x", "o", "t" }, "<cmd>lua TermToggleNode('float')<cr>", desc = "Node" },
      -- lua
      { "<leader>tl", "<cmd>lua TermToggleLua('float')<cr>", desc = "Lua" },
      { "<a-7>", mode = { "n", "x", "o", "t" }, "<cmd>lua TermToggleLua('float')<cr>", desc = "Lua" },
      --
    },
  },
}
