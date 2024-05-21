return {
  -- Overall
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = {
      "stevearc/overseer.nvim",
    },
    opts = {},
  },
  {
    "stevearc/overseer.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  -- TS / JS
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {
      use_trouble_qflist = true,
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "ts", "tsx" },
  },
}
