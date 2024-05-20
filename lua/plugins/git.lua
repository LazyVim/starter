return {
  {
    "f-person/git-blame.nvim",
    lazy = true,
    event = "BufReadPre",
    opts = {
      date_format = "%x • %X",
      schedule_event = "CursorHold",
      clear_event = "CursorHoldI",
    },
  },
}
