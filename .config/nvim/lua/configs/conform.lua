require("conform").setup({
    format_on_save = {
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
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "biome" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        typst = { "typstyle" },
        -- php = { "pint" },
        -- sql = { "sql_formatter" },
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
