local present, lspconfig = pcall(require, "lspconfig")
if not present then
    return
end

local root_pattern = require("lspconfig").util.root_pattern

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

require("lspconfig.ui.windows").default_options.border = "single"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

local function on_attach(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        auto_close_after = 5,
        toggle_key = "<C-e>",
        use_lspsaga = false,
        floating_window = true,
        hint_enable = true,
        handler_opts = { border = "rounded" },
    })
end

-- LSP SERVER
lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim", "packer_plugins" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
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
    on_attach = function(client, bufnr)
        require("ltex_extra").setup({
            load_langs = { "es" },
            init_check = true,
            path = ".ltex",
            log_level = "none",
        })
    end,
    settings = {
        ltex = {
            language = "es",
            diagnosticSeverity = "information",
            sentenceCacheSize = 2000,
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
        },
    },

    root_dir = root_pattern("*.tex"),
})

lspconfig.html.setup({
    filetypes = { "html", "htmldjango" },
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.emmet_ls.setup({
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby", "htmldjango" },
    capabilities = capabilities,
    on_attach = on_attach,
})

for _, server in ipairs({ "bashls", "cssls", "pyright", "rust_analyzer", "tsserver" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
