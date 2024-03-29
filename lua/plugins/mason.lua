-- return {
--   "williamboman/mason.nvim",
--   opts = function(_, opts)
--     table.insert(opts.ensure_installed, "prettierd")
--   end,
-- }

return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, { "markdownlint", "marksman" })
  end,
}
