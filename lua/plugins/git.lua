return {
	{
		"f-person/git-blame.nvim",
		event = "BufReadPre",
		opts = {
			date_format = "%x • %X",
			schedule_event = "CursorHold",
			clear_event = "CursorHoldI",
		},
	},
}
