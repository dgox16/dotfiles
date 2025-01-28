local lspconfig = require("lspconfig")

local capabilities = require("blink.cmp").get_lsp_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local function on_attach(client, bufnr) end

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

lspconfig.tinymist.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    offset_encoding = "utf-8",
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onSave",
    },
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
            },
        },
    },
})

lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "javascriptreact", "typescriptreact", "astro", "svelte" },
})

lspconfig.basedpyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            },
        },
    },
})

lspconfig.astro.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        typescript = {
            tsdk = vim.fs.normalize("/usr/lib/node_modules/typescript/lib/"),
        },
    },
})

for _, server in ipairs({ "intelephense", "bashls", "marksman", "biome", "cssls", "basedpyright", "html" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
