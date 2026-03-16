return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    heading = {
      sign = false,
      icons = { "> ", "> " },
      width = { "full", "block" },
      left_pad = 1,
      right_pad = 2,
    },
    checkbox = {
      enabled   = true,
      unchecked = { icon = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
      checked   = { icon = "󰱒 ", highlight = "RenderMarkdownChecked" },
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
    },
    anti_conceal = { enabled = false },
  },
}
