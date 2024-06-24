return {
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"rmagatti/auto-session",
		event = "VimEnter",
		opts = {
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_use_git_branch = true,
			pre_save_cmds = { "BDelete! nameless", "BDelete! hidden", "BDelete glob=yode*", "cclose" },
		},
	},
	{
		{
			"antosha417/nvim-lsp-file-operations",
			event = "LspAttach",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-neo-tree/neo-tree.nvim",
			},
		},
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		opts = {
			float_opts = {
				border = "curved",
				title_pos = "left",
				width = 128,
				height = 16,
				row = 1,
			},
			winbar = {
				enabled = true,
				name_formatter = function(term)
					return term.name
				end,
			},
		},
	},
	{
		"tris203/precognition.nvim",
		cmd = "Precognition toggle",
		opts = {
			startVisible = true,
			showBlankVirtLine = false,
		},
	},
}
