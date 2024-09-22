require("conform").setup({
    format_on_save = {
        -- These options will be passed to conform.format()
        -- timeout_ms = 1000,
        lsp_fallback = true,
    },
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "usort" },
        json = { "biome" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        -- htmldjango = { "djhtml" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "biome" },
        handlebars = { "prettier" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        typst = { "typstyle" },
        -- php = { "pint" },
        -- sql = { "sql_formatter" },
    },
    formatters = {
        djhtml = {
            command = "djhtml",
            args = {
                "-",
            },
            stdin = true,
            require_cwd = false,
        },
        bibclean = {
            command = "bibclean",
            args = {
                "-align-equals",
                "-delete-empty-values",
            },
            stdin = true,
        },
        -- ruff = {
        --     command = "ruff",
        --     args = {
        --         "format",
        --         "--stdin-filename",
        --         "$FILENAME",
        --         "-",
        --     },
        --     stdin = true,
        --     cwd = require("conform.util").root_file({
        --         "pyproject.toml",
        --         "ruff.toml",
        --     }),
        -- },
    },
})

require("conform.formatters.stylua").args = {
    "--indent-type",
    "Spaces",
    "--search-parent-directories",
    "--stdin-filepath",
    "$FILENAME",
    "-",
}

require("conform.formatters.prettier").args = {
    "--tab-width",
    "4",
    "--stdin-filepath",
    "$FILENAME",
}
