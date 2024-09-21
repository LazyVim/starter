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
	{
		"javiorfo/nvim-soil",
		dependencies = { "javiorfo/nvim-nyctophilia" },

		lazy = true,
		ft = "plantuml",
		opts = {
			-- puml_jar = "/path/to/plantuml.jar",

			image = {
				darkmode = false, -- Enable or disable darkmode
				format = "png", -- Choose between png or svg
				execute_to_open = function(img)
					return "kitten icat" .. img
				end,
			},
		},
	},
}
