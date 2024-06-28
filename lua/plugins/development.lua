require("dap.ext.vscode").load_launchjs()
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
	{
		"zeioth/garbage-day.nvim",
		event = "LspAttach",
		dependencies = "neovim/nvim-lspconfig",
		opts = {},
	},
	{
		"piersolenski/telescope-import.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("import")
		end,
	},
	{
		"Tastyep/structlog.nvim",
	},
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
	-- C#
	{
		"iabdelkareem/csharp.nvim",
		ft = "cs",
		keys = {
			{
				"<F5>",
				function()
					require("csharp").debug_project()
				end,
				{ desc = "C# debug project", noremap = true, nowait = true },
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			"Tastyep/structlog.nvim",
		},
		config = function()
			require("mason").setup()
			require("csharp").setup()
		end,
	},
}
