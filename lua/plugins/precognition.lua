return {
  -- Other options
  -- nvim-spider
  -- leap.nvim
  "tris203/precognition.nvim",
  event = "VeryLazy",
  opts = {
    startVisible = false,
    showBlankVirtLine = true,
    highlightColor = { link = "Comment" },
    hints = {
      Caret = { text = "^", prio = 2 },
      Dollar = { text = "$", prio = 1 },
      MatchingPair = { text = "%", prio = 5 },

      Zero = { text = "0", prio = 1 },

      w = { text = "w", prio = 10 },
      b = { text = "b", prio = 9 },
      e = { text = "e", prio = 8 },
      ge = { text = "ge", prio = 7 },
      W = { text = "W", prio = 7 },
      B = { text = "B", prio = 6 },
      E = { text = "E", prio = 5 },
      gE = { text = "gE", prio = 4 },

      f = { text = "f", prio = 10 },
      F = { text = "F", prio = 9 },
      t = { text = "t", prio = 8 },
      T = { text = "T", prio = 7 },

      ["("] = { text = "(", prio = 3 },
      [")"] = { text = ")", prio = 3 },
    },
    gutterHints = {
      G = { text = "G" },
      gg = { text = "gg" },
      PrevParagraph = { text = "{" },
      NextParagraph = { text = "}" },

      Top = { text = "H" },
      Middle = { text = "M" },
      Bottom = { text = "L" },

      SearchForward = { text = "/" },
      SearchBackward = { text = "?" },
      NextMatch = { text = "n" },
      PrevMatch = { text = "N" },

      MarkJump = { text = "'" },
    },
  },
}
