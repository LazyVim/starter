return {
	{
		"jbyuki/instant.nvim",
		cmd = {
			"InstantStartServer",
			"InstantStopServer",
		},
	},
	{
		"miversen33/netman.nvim",
		cmd = {
			"Neotree remote",
		},
	},
	-- {
	-- 	"rmagatti/auto-session",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- 	opts = {
	-- 		-- auto_session_enable_last_session = true,
	-- 		auto_session_enabled = true,
	-- 		auto_save_enabled = true,
	-- 		auto_restore_enabled = true,
	-- 		pre_save = {},
	-- 		auto_session_create_enabled = function()
	-- 			local cmd = "git rev-parse --is-inside-work-tree"
	-- 			return vim.fn.system(cmd) == "true\n"
	-- 		end,
	-- 		session_lens = {
	-- 			load_on_setup = true,
	-- 			theme_conf = {
	-- 				border = true,
	-- 			},
	-- 			previewer = true,
	-- 			buftypes_to_ignore = {},
	-- 		},
	-- 		cwd_change_handling = {
	-- 			-- restore_upcoming_session = true,
	-- 			post_cwd_changed_hook = function()
	-- 				require("lualine").refresh()
	-- 			end,
	-- 		},
	-- 	},
	-- },
	{
		"rmagatti/session-lens",
		dependencies = {
			"rmagatti/auto-session",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			path_display = {
				"shorten",
			},
		},
	},
}
