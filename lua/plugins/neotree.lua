return {
  "nvim-neo-tree/neo-tree.nvim",
  config = {
    window = {
      position = "right",
      mappings = {
        l = "open",
        h = "close_node",
        H = "close_all_nodes",
        ["<esc>"] = false,
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
      },
    },
  },
}
