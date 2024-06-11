return {
	{
		"neanias/everforest-nvim",
		opts = {
			background = "medium",
			transparent_background_level = 2,
			italics = true,
			ui_contrast = "high",
		},
		config = function() end,
	},
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
	{
		"kevinhwang91/nvim-ufo",
		event = "BufReadPre",
	},
	{
		"2kabhishek/nerdy.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Nerdy",
	},
}
