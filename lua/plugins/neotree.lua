-- by default show hidden files
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    -- 设置窗口的宽度和按键绑定
    opts.window.mappings.o = "open"
    opts.window.width = 27

    -- 显示隐藏文件的配置
    opts.filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- 设置为false以显示隐藏文件
      },
    }
  end,
}
