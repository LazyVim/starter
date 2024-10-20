local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local function generate_import_specs()
	local specs = {}

	local function add_specs_from_dir(path)
		local uv = vim.loop
		local stats = uv.fs_readdir(uv.fs_opendir(vim.fn.stdpath("config") .. "/" .. "lua" .. "/" .. path, nil, 1000))
		if not stats then
			return
		end
		for _, stat in ipairs(stats) do
			-- print(stat.name)
			if stat.type == "directory" then
				local new_import_path = path .. "/" .. stat.name
				table.insert(specs, { import = new_import_path:gsub("/", ".") })
				add_specs_from_dir(new_import_path)
			elseif stat.name == "init.lua" then
				table.remove(specs) -- removes last element
			end
		end
	end

	add_specs_from_dir("plugins")
	return specs
end

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	-- bootstrap lazy.nvim
	-- stylua: ignore
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
		lazypath })
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- import any extras modules here
		-- import/override with your plugins
		generate_import_specs(),
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = true,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	ui = {
		border = "rounded",
	},
	install = { colorscheme = { "everforest" } },
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	}, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
