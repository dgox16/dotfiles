return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        opts = {},
        config = function()
            require("conform").setup({
                format_on_save = {
                    -- These options will be passed to conform.format()
                    -- timeout_ms = 1000,
                    lsp_fallback = true,
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "usort", "black" },
                    json = { "biome" },
                    javascript = { "biome" },
                    javascriptreact = { "biome" },
                    typescript = { "biome" },
                    typescriptreact = { "biome" },
                    htmldjango = { "djhtml" },
                    markdown = { "prettier" },
                    html = { "prettier" },
                    css = { "prettier" },
                    handlebars = { "prettier" },
                    bib = { "bibclean" },
                    tex = { "latexindent" },
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
        end,
    },
}
