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

-- lspconfig.intelephense.setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = {
--         intelephense = {
--             stubs = {
--                 "apache",
--                 "bcmath",
--                 "bz2",
--                 "calendar",
--                 "com_dotnet",
--                 "Core",
--                 "ctype",
--                 "curl",
--                 "date",
--                 "dba",
--                 "dom",
--                 "enchant",
--                 "exif",
--                 "FFI",
--                 "fileinfo",
--                 "filter",
--                 "fpm",
--                 "ftp",
--                 "gd",
--                 "gettext",
--                 "gmp",
--                 "hash",
--                 "iconv",
--                 "imap",
--                 "intl",
--                 "json",
--                 "ldap",
--                 "libxml",
--                 "mbstring",
--                 "meta",
--                 "mysqli",
--                 "oci8",
--                 "odbc",
--                 "openssl",
--                 "pcntl",
--                 "pcre",
--                 "PDO",
--                 "pdo_ibm",
--                 "pdo_mysql",
--                 "pdo_pgsql",
--                 "pdo_sqlite",
--                 "pgsql",
--                 "Phar",
--                 "posix",
--                 "pspell",
--                 "readline",
--                 "Reflection",
--                 "session",
--                 "shmop",
--                 "SimpleXML",
--                 "snmp",
--                 "soap",
--                 "sockets",
--                 "sodium",
--                 "SPL",
--                 "sqlite3",
--                 "standard",
--                 "superglobals",
--                 "sysvmsg",
--                 "sysvsem",
--                 "sysvshm",
--                 "tidy",
--                 "tokenizer",
--                 "xml",
--                 "xmlreader",
--                 "xmlrpc",
--                 "xmlwriter",
--                 "xsl",
--                 "Zend OPcache",
--                 "zip",
--                 "zlib",
--                 "wordpress",
--                 "phpunit",
--             },
--             diagnostics = {
--                 enable = true,
--             },
--             format = {
--                 enable = false,
--             },
--         },
--     },
-- })

for _, server in ipairs({ "bashls", "marksman", "biome", "cssls", "html", "astro" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
