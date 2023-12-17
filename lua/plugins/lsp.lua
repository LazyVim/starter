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
        "cspell",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "lua-language-server",
      },
    },
  },
  -- lsp servers
}
