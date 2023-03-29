return {
  "nvim-neo-tree/neo-tree.nvim",
  config = {
    window = {
      position = "right",
      mappings = {
        l = "toggle_node",
        L = "close_all_nodes",
        ["<esc>"] = false,
      },
    },
  },
}
