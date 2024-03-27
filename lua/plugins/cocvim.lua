return {
    -- {
    --     'neoclide/coc.nvim',
    --     branch = 'master',
    --     build = "yarn install --frozen-lockfile",
    -- },
    {
        'onns/bookmarks.nvim',
        keys = {},
        branch = 'main',
        dependencies = { 'nvim-web-devicons' },
        config = function()
            require("bookmarks").setup()
            require("telescope").load_extension("bookmarks")
        end
    },
    -- {
    --     "scrooloose/nerdtree",
    --     keys = {
    --         {
    --             "<leader>e",
    --             "<cmd>NERDTreeToggle<cr>",
    --             desc = "NERDTreeToggle"
    --         },
    --         {
    --             "<leader>v",
    --             "<cmd>NERDTreeFind<cr>",
    --             desc = "NERDTreeFind"
    --         }
    --     },
    --     config = function()
    --         require("neo-tree").setup()
    --     end
    -- },
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
        "git@github.com:majutsushi/tagbar.git",
        keys = {
            {
                "<leader>t",
                "<cmd>TagbarToggle<cr>",
                desc = "TagbarToggle"
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
}
