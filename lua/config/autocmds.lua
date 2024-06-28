-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set Mini.files rounded border
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesWindowOpen",
	callback = function(args)
		local win_id = args.data.win_id
		vim.api.nvim_win_set_config(win_id, { border = "rounded" })
	end,
})
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format({ timeout = 1000, async = false })
				if vim.bo[0].filetype == "cs" then
					require("csharp").fix_usings()
				end
			end,
		})
	end,
})
