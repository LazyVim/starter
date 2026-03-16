local util = require("conform.util")

return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      prettier = {
        command = util.from_node_modules(".yarn/sdks/prettier/bin/prettier.cjs"),
      },
      eslint = {
        -- Run project ESLint through Yarn
        command = "yarn",
        args = { "eslint", "--fix-dry-run", "--stdin", "--stdin-filename", "$FILENAME" },
        stdin = true,
        cwd = util.root_file({ "eslint.config.mjs", ".pnp.cjs", "package.json" }),
        timeout = 10000, -- 10s; adjust if needed
      },
    },
    formatters_by_ft = {
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
    },
  },
}
