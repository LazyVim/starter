return {
    {
        'onns/bookmarks.nvim',
        keys = {},
        lazy = false,
        branch = 'main',
        dependencies = { 'nvim-web-devicons' },
        config = function()
            require("bookmarks").setup()
            require("telescope").load_extension("bookmarks")
        end
    },
    {
        "git@github.com:navarasu/onedark.nvim.git",
        lazy = false,
        config = function()
            require('onedark').setup {
                style = 'darker'
            }
            require('onedark').load()
        end
    },
    {
        'git@github.com:fatih/vim-go.git'
    },
    {
        "git@github.com:junegunn/fzf.git"
    },
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            {
                "<leader>t",
                "<cmd>AerialToggle<cr>",
                desc = "AerialToggle"
            }
        }
    },
    {
        "git@github.com:mhinz/vim-startify.git", lazy = false
    },
    {
        'git@github.com:wakatime/vim-wakatime.git'
    },
    {
        'buoto/gotests-vim'
    },
    {
        'tpope/vim-fugitive'
    },
}
