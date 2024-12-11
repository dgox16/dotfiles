local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
    single_file_support = true,
    root_dir = function()
        return vim.fn.getcwd()
    end,
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
    filetypes = { "html", "javascriptreact", "typescriptreact", "astro", "svelte" },
})

for _, server in ipairs({ "intelephense", "bashls", "marksman", "biome", "cssls", "astro", "tinymist" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
