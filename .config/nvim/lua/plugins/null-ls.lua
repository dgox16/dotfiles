return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        config = function()
            local null_ls = require("null-ls")

            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics

            local lsp_formatting = function(bufnr)
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                })
            end

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            null_ls.setup({
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                lsp_formatting(bufnr)
                            end,
                        })
                    end
                end,

                sources = {
                    -- LUA
                    formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
                    -- HTML y CSS
                    formatting.prettier.with({
                        extra_args = { "--tab-width", "4" },
                        disabled_filetypes = {
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "json",
                        },
                    }),
                    -- JS, TS y JSON
                    formatting.rome.with({
                        extra_args = { "--indent-style", "space", "--indent-size", "4", "--line-width", "90" },
                    }),
                    -- Python
                    formatting.isort,
                    diagnostics.ruff,
                    formatting.black,
                    -- Bash
                    formatting.beautysh,
                    -- TOML
                    formatting.taplo,
                    -- HTMLDjango
                    diagnostics.djlint,
                    formatting.djlint,
                    -- PHP
                    diagnostics.php,
                    formatting.phpcsfixer,
                    -- Latex
                    formatting.latexindent,
                    formatting.bibclean.with({ extra_args = { "-max-width", "0" } }),
                },
            })
        end,
    },
}
