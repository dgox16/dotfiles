local lspconfig = require("lspconfig")

local root_pattern = require("lspconfig").util.root_pattern

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

lspconfig.ltex.setup({
    capabilities = capabilities,
    -- flags = { debounce_text_changes = 300 },
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
        }),
    },
    on_attach = function(client, bufnr)
        require("ltex_extra").setup({
            load_langs = { "es" },
            init_check = true,
            path = ".ltex",
            log_level = "error",
        })
    end,
    settings = {
        ltex = {
            language = "es",
            checkFrequency = "save",
            additionalRules = {
                enablePickyRules = true,
                motherTongue = "es",
            },
        },
    },
})

lspconfig.texlab.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        texlab = {
            rootDirectory = ".",
            build = {
                args = { "-pdf", "-interaction=nonstopmode", "-shell-escape", "-synctex=1", "%f" },
                onSave = true,
            },
            forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
            bibtexFormatter = "latexindent",
        },
    },
    root_dir = root_pattern("*.tex"),
})

lspconfig.html.setup({
    filetypes = { "html", "htmldjango" },
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.tailwindcss.setup({
    filetypes = { "html", "javascriptreact", "typescriptreact" },
})

for _, server in ipairs({ "bashls", "biome", "cssls" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
