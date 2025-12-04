require("conform").setup({
    formatters = {
        kulala = {
            command = "kulala-fmt",
            args = { "format", "$FILENAME" },
            stdin = false,
        },
    },
    default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
    },
    format_on_save = {
        lsp_fallback = true,
    },
    formatters_by_ft = {
        lua = { "stylua" },
        json = { "biome" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        css = { "biome" },
        html = { "biome" },
        http = { "kulala" },
        dockerfile = { "dockerfmt" },
        -- markdown = { "prettier" },
        -- rust = { "rustfmt" },
        -- sh = { "shfmt" },
        -- typst = { "typstyle" },
        -- php = { "pint" },
        -- yaml = { "prettier" },
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
