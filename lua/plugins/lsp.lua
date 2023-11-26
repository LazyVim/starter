return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "selene",
        "luacheck",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      },
    },
  },
  -- lsp servers
}
