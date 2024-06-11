return {
	{
		"f-person/git-blame.nvim",
		event = "BufReadPre",
		opts = {
			delay = 10,
			date_format = "%x • %X",
			-- schedule_event = "CursorHold",
			-- clear_event = "CursorHoldI",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"agoodshort/telescope-git-submodules.nvim",
				dependencies = "akinsho/toggleterm.nvim",
			},
		},
		config = function()
			require("telescope").load_extension("git_submodules")
		end,
	},
}
