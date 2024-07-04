return {
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
}
