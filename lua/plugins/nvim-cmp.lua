return {}

-- return {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
--   },
--   opts = function(_, opts)
--     -- original LazyVim kind icon formatter
--     local format_kinds = opts.formatting.format
--     opts.formatting.format = function(entry, item)
--       format_kinds(entry, item) -- add icons
--       return require("tailwindcss-colorizer-cmp").formatter(entry, item)
--     end
--   end,
-- }
