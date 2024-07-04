return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    opts = {
      render = "virtual",
      virtual_symbol = "",
      enable_tailwind = true,
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPre",
  },
}
