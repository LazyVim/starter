return {
	{
		"3rd/image.nvim",
		ft = { "markdown", "quarto", "vimwiki" },
		dependencies = { "leafo/magick" },
		opts = {
			integrations = {
				markdown = {
					clear_in_insert_mode = true,
					only_render_image_at_cursor = true,
				},
			},
			html = {
				enabled = true,
			},
			editor_only_render_when_focused = true,
			window_overlap_clear_enabled = true, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = true,
		},
	},
}
