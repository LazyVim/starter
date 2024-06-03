local logo = [[
	                              ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆                                  
	                               ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦                               
	                                     ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄                             
	                                      ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄                            
	                                     ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀                           
                               ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄                           
  ███▄    █ ▓█████  ▒█████    ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄    ██▒   █▓ ██▓ ███▄ ▄███▓ 
  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ▓██░   █▒▓██▒▓██▒▀█▀ ██▒ 
 ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄  ▓██  █▒░▒██▒▓██    ▓██░ 
 ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆       ▒██ █░░░██░▒██    ▒██  
 ▒██░   ▓██░░▒████▒░ ████▓▒░       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃        ▒▀█░  ░██░▒██▒   ░██▒ 
░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ╰──────────────────────────────╯    ░ ▐░  ░▓  ░ ▒░   ░  ░ 
░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░                                        ░ ░░   ▒ ░░  ░      ░ 
   ░   ░ ░    ░   ░ ░ ░ ▒                                           ░░   ▒ ░░      ░    
         ░    ░  ░    ░ ░                                            ░   ░         ░    
                                                                    ░                   ]]
local section = require("alpha.themes.dashboard").section
return {
	{
		"catppuccin/nvim",
		enabled = false,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "everforest",
		},
	},
	{
		"goolord/alpha-nvim",
		opts = {
			section = {
				header = {
					val = vim.split(logo, "\n"),
				},
			},
			opts = {
				layout = {
					{ type = "padding", val = 3 },
					section.header,
					{ type = "padding", val = 2 },
					section.buttons,
					{ type = "padding", val = 3 },
					section.footer,
				},
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		opts = {
			window = {
				documentation = {
					border = "rounded",
				},
				completion = {
					border = "rounded",
				},
			},
		},
	},
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
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_z = {
					require("auto-session.lib").current_session_name,
				},
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		version = "*",
		opts = {
			auto_clean_after_session_restore = true,
			close_if_last_window = true,
			window = {
				width = 30,
				mappings = {
					["h"] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" and node:is_expanded() then
							require("neo-tree.sources.filesystem").toggle_directory(state, node)
						else
							require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
						end
					end,
					["l"] = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						if node.type == "directory" then
							if not node:is_expanded() then
								require("neo-tree.sources.filesystem").toggle_directory(state, node)
							elseif node:has_children() then
								require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
							end
						end
						if node.type == "file" then
							require("neo-tree.utils").open_file(state, path)
						end
					end,
				},
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 2500,
			fps = 170,
			stages = "fade_in_slide_out",
		},
	},
			},
		},
	},
}
