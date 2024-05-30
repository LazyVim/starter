return {
	-- Overall
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
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},
	-- {
	-- 	"zeioth/garbage-day.nvim",
	-- 	event = "LspAttach",
	-- 	dependencies = "neovim/nvim-lspconfig",
	-- 	opts = {},
	-- },
	-- TS / JS
	{
		"dmmulroy/tsc.nvim",
		cmd = "TSC",
		opts = {
			use_trouble_qflist = true,
		},
		ft = {
			"typescript",
			"typescriptreact",
		},
	},
	{
		"Redoxahmii/json-to-types.nvim",
		cmd = { "ConvertJSONtoTS", "ConvertJSONtoTSBuffer" },
		build = "sh install.sh bun",
		ft = {
			"typescript",
			"typescriptreact",
		},
	},
	{
		"barrett-ruth/import-cost.nvim",
		build = "sh install.sh bun",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		ft = {
			"typescript",
			"typescriptreact",
		},
	},
}
