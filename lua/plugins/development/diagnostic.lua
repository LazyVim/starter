return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				left = "",
				right = "",
				diag = "●",
				arrow = "    ",
				up_arrow = "    ",
				vertical = "│",
				-- vertical_end = "╰",
				vertical_end = "└",
			},
			break_line = {
				enabled = true,
				after = 15,
			},
		},
	},
}
