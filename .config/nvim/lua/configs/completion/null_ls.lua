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
        formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
        formatting.prettier.with({ extra_args = { "--tab-width", "4" } }),
        formatting.rustfmt,
        formatting.isort,
        diagnostics.flake8,
        diagnostics.djlint,
        formatting.djlint,
        formatting.djlint,
        formatting.black,
        formatting.latexindent,
    },
})
