return {
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                ["sql"] = { "sql_formatter" },
            },
        },
    },
}
