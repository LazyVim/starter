return {
	"max397574/better-escape.nvim",
	event = "InsertEnter",
	opts = {
		default_mappings = true,
		mappings = {
			t = { j = { false } }, --lazygit navigation fix
			v = { j = { k = false } }, -- visual select fix
		},
	},
}
