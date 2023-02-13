return {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "barreiroleo/ltex-extra.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")

        -- stylua: ignore start
        vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "g{", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "g}", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
        -- stylua: ignore end

        local root_pattern = require("lspconfig").util.root_pattern

        vim.diagnostic.config({
            virtual_text = true,
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

        local function on_attach(client, bufnr) end
        -- LSP SERVER
        lspconfig.lua_ls.setup({
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
            handlers = {
                ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    -- Disable virtual_text
                    virtual_text = false,
                }),
            },
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
            filetypes = {
                "html",
                "typescriptreact",
                "javascriptreact",
                "css",
                "sass",
                "scss",
                "less",
                "eruby",
                "htmldjango",
            },
            capabilities = capabilities,
            on_attach = on_attach,
        })

        for _, server in ipairs({ "bashls", "cssls", "pyright", "rust_analyzer", "tsserver" }) do
            lspconfig[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end
    end,
}
