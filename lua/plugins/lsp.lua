-- Extra language server protocol options
return {
  { -- Bulb in gutter for code actions
    "kosayoda/nvim-lightbulb",
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
        number = { enabled = true },
      })
    end,
  },
  { -- LSP Diagnostics in top right
    "dgagn/diagflow.nvim",
    opts = { scope = "line" },
  },
  { "mfussenegger/nvim-jdtls" },
  {
    "chrisbra/csv.vim",
  },
  { -- Merge lines
    "Wansmer/treesj",
    keys = {
      "<space>m",
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({})
    end,
  },
  { -- Treesitter config
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "java",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  { -- Mason config
    "mason-org/mason.nvim",
    opts = {
      ui = { border = "rounded" },
      ensure_installed = {
        "bash-language-server",
        "prettierd",
        "css-lsp",
        "ruff-lsp",
        "pyright",
        "autopep8",
        "shellcheck",
        "sonarlint-language-server",
      },
    },
  },
  { "mason-org/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        ruff_lsp = {
          init_options = {
            settings = {
              args = {
                "--ignore=PLC0415", -- Ignore the import-outside-toplevel error
              },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                diagnosticSeverityOverrides = {
                  reportUnusedImport = "information",
                  reportUnusedVariable = "information",
                },
                -- Disable features that conflict with ruff
                disableOrganizeImports = true, -- Let ruff handle this
              },
            },
          },
        },
      },
    },
  },
  {
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    ft = { "python", "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
    dependencies = {
      "mfussenegger/nvim-jdtls",
    },
    config = function()
      require("sonarlint").setup({
        server = {
          cmd = {
            "sonarlint-language-server",
            "-stdio",
            "-analyzers",
            vim.fn.stdpath("data") .. "/mason/share/sonarlint-analyzers/sonarpython.jar",
            vim.fn.stdpath("data") .. "/mason/share/sonarlint-analyzers/sonarjs.jar",
            vim.fn.stdpath("data") .. "/mason/share/sonarlint-analyzers/sonarjava.jar",
          },
        },
        filetypes = {
          "typescript",
          "typescriptreact",
          "javascript",
          "javascriptreact",
          -- "python",
        },
      })
    end,
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {},
    name = "render-markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },
}
