-- lua/plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint" },
    },
    -- Configuración específica para markdownlint
    linters = {
      markdownlint = {
        -- Aquí está la magia: le pasamos el argumento --config
        args = { "--config", vim.fn.expand("~/.markdownlint.jsonc") },
      },
    },
  },
}
