return {
	{
		"jbyuki/instant.nvim",
		cmd = {
			"InstantStartServer",
			"InstantStopServer",
		},
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		cmd = {
			"CodeSnap",
			"CodeSnapSave",
		},
		opts = {
			save_path = "~/Pictures/ScreenShot/",
			has_line_number = true,
			watermark = "• FM39hz •",
			bg_color = "#535c68",
			code_font_family = "JetbrainsMono Nerd Font",
		},
	},
}
