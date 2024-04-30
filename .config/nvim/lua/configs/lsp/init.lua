local lspconfig = require("lspconfig")

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    severity_sort = true,
})

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require("lspconfig.ui.windows").default_options.border = "single"

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local function on_attach(client, bufnr) end

-- LSP SERVER
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
            },
            completion = {
                callSnippet = "Replace",
            },
        },
    },
})

lspconfig.pylance.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.jsonls.setup({
    flags = { debounce_text_changes = 500 },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        json = {
            schemas = {
                {
                    fileMatch = { "package.json" },
                    url = "https://json.schemastore.org/package.json",
                },
                {
                    fileMatch = { "tsconfig*.json" },
                    url = "https://json.schemastore.org/tsconfig.json",
                },
                {
                    fileMatch = {
                        ".prettierrc",
                        ".prettierrc.json",
                        "prettier.config.json",
                    },
                    url = "https://json.schemastore.org/prettierrc.json",
                },
                {
                    fileMatch = { ".eslintrc", ".eslintrc.json" },
                    url = "https://json.schemastore.org/eslintrc.json",
                },
                {
                    fileMatch = {
                        ".babelrc",
                        ".babelrc.json",
                        "babel.config.json",
                    },

                    url = "https://json.schemastore.org/babelrc.json",
                },
                {

                    fileMatch = { "lerna.json" },
                    url = "https://json.schemastore.org/lerna.json",
                },
                {
                    fileMatch = {
                        ".stylelintrc",
                        ".stylelintrc.json",
                        "stylelint.config.json",
                    },

                    url = "http://json.schemastore.org/stylelintrc.json",
                },
                {
                    fileMatch = { "/.github/workflows/*" },
                    url = "https://json.schemastore.org/github-workflow.json",
                },
            },
        },
    },
})

lspconfig.html.setup({
    filetypes = { "html", "htmldjango" },
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.tailwindcss.setup({
    filetypes = { "html", "javascriptreact", "typescriptreact" },
})
for _, server in ipairs({ "bashls", "biome", "cssls", "astro" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
