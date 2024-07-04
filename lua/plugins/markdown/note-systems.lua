return {
	{
		"epwalsh/obsidian.nvim",
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "Project Pillar",
					path = "~/.vault/Rouge Pillar/",
				},
			},
		},
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		ft = { "norg" },
		version = "*",
	},
	{
		"jmbuhr/otter.nvim",
		ft = "markdown",
		dependencies = {
			"hrsh7th/nvim-cmp", -- optional, for completion
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
