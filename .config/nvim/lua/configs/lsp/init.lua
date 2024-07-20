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
lspconfig.emmet_language_server.setup({
    filetypes = { "html", "javascriptreact", "typescriptreact", "astro" },
})

lspconfig.tailwindcss.setup({
    filetypes = { "html", "javascriptreact", "typescriptreact", "astro", "svelte" },
})

local util = require("lspconfig.util")
local root_files = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
}
local pylance_default_config = {
    default_config = {
        filetypes = { "python" },
        root_dir = util.root_pattern(unpack(root_files)),
        cmd = { "pylance", "--stdio" },
        single_file_support = true,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        settings = {
            editor = { formatOnType = false },
            python = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "openFilesOnly", --"workspace",
                    typeCheckingMode = "basic",
                    completeFunctionParens = true,
                    autoFormatStrings = true,
                    indexing = false,
                    inlayHints = {
                        variableTypes = true,
                        functionReturnTypes = true,
                        callArgumentNames = true,
                        pytestParameters = true,
                    },
                },
            },
        },
    },
}

lspconfig.svelte.setup({
    on_attach = function(client, _)
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
        })
    end,
    -- settings = {
    --     typescript = {
    --         inlayHints = lsp_utils.typescriptInlayHints,
    --     },
    -- },
})

require("lspconfig.configs").pylance = pylance_default_config

for _, server in ipairs({ "bashls", "biome", "cssls", "astro", "typst_lsp", "pylance" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
