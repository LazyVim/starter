return {
	{
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = {
			"stevearc/overseer.nvim",
		},
		opts = {},
	},
	{
		"stevearc/overseer.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo", "OverseerRun" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},
}
