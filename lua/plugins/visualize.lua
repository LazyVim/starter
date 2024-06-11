---@diagnostic disable: missing-fields
return {
	{
		"neanias/everforest-nvim",
		config = function()
			require("everforest").setup({
				background = "medium",
				italics = true,
				ui_contrast = "low",
				float_style = "dim",
				diagnostic_text_highlight = true,
			})
		end,
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
