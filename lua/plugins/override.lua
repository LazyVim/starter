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
					section.header,
					{ type = "padding", val = 1 },
					section.buttons,
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
	{
		"nvimtools/none-ls.nvim",
		opts = {
			source = {
				builtins = {
					csharpier = {
						args = { "--write-stdout", "--no-cache", "$FILENAME" },
					},
				},
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				preview = {
					mime_hook = function(filepath, bufnr, opts)
						local is_image = function(_filepath)
							local image_extensions = { "png", "jpg" }
							local split_path = vim.split(_filepath:lower(), ".", { plain = true })
							local extension = split_path[#split_path]
							return vim.tbl_contains(image_extensions, extension)
						end
						if is_image(filepath) then
							local term = vim.api.nvim_open_term(bufnr, {})
							local function send_output(_, data, _)
								for _, d in ipairs(data) do
									vim.api.nvim_chan_send(term, d .. "\r\n")
								end
							end
							vim.fn.jobstart({
								"kitten",
								"icat",
								filepath,
							}, { on_stdout = send_output, stdout_buffered = true, pty = true })
						else
							require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
						end
					end,
				},
			},
		},
	},
}
