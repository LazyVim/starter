return {
	{
		"folke/noice.nvim",
		opts = {
			presets = {
				bottom_search = false,
				lsp_doc_border = true,
			},
			lsp = {
				hover = {
					silent = true,
				},
			},
		},
	},
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	dependencies = {
	-- 		"rmagatti/auto-session",
	-- 	},
	-- 	opts = {
	-- 		sections = {
	-- 			lualine_z = {
	-- 				require("auto-session.lib").current_session_name,
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 2500,
			fps = 170,
			stages = "fade_in_slide_out",
		},
	},
}
