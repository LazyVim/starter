require("config.lazy")

if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font:h15.4:b"
	vim.opt.linespace = -4
	vim.g.neovide_refresh_rate = 170
end
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
