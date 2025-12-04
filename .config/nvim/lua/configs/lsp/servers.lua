local capabilities = require("blink.cmp").get_lsp_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local function on_attach(client, bufnr) end

-- Lua
vim.lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
            },
            telemetry = { enable = false },
            completion = {
                callSnippet = "Replace",
            },
        },
    },

    root_dir = vim.fs.root(0, { ".git", ".luarc.json", "init.lua" }),
}


-- Typescript
vim.lsp.config["vtsls"] = {
    cmd = { "vtsls", "--stdio" },
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
    },
    root_dir = vim.fs.root(0, {
        "tsconfig.json",
        "jsconfig.json",
        "package.json",
        ".git",
    }),
    settings = {
        vtsls = {
            autoUseWorkspaceTsdk = true,
        },
        typescript = {
            preferences = {
                importModuleSpecifier = "non-relative",
                quotePreference = "single",
            },
        },
        javascript = {
            preferences = {
                importModuleSpecifier = "non-relative",
                quotePreference = "single",
            },
        },
    },
}

vim.lsp.enable({ "vtsls", "luals" })

-- -- TinyTeX / Typst (tinymist)
-- vim.lsp.start({
--     name = "tinymist",
--     cmd = { "tinymist" },
--     capabilities = capabilities,
--     on_attach = on_attach,
--     offset_encoding = "utf-8",
--     settings = {
--         formatterMode = "typstyle",
--         exportPdf = "onSave",
--     },
--     root_dir = vim.fs.root(0, { ".git" }),
-- })
--
-- -- JSON
-- vim.lsp.start({
--     name = "jsonls",
--     cmd = { "vscode-json-language-server", "--stdio" },
--     flags = { debounce_text_changes = 500 },
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = {
--         json = {
--             schemas = {
--                 {
--                     fileMatch = { "package.json" },
--                     url = "https://json.schemastore.org/package.json",
--                 },
--                 {
--                     fileMatch = { "tsconfig*.json" },
--                     url = "https://json.schemastore.org/tsconfig.json",
--                 },
--                 {
--                     fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
--                     url = "https://json.schemastore.org/prettierrc.json",
--                 },
--                 {
--                     fileMatch = { ".eslintrc", ".eslintrc.json" },
--                     url = "https://json.schemastore.org/eslintrc.json",
--                 },
--             },
--         },
--     },
--     root_dir = vim.fs.root(0, { ".git" }),
-- })
--
-- -- TailwindCSS
-- vim.lsp.start({
--     name = "tailwindcss",
--     cmd = { "tailwindcss-language-server", "--stdio" },
--     capabilities = capabilities,
--     on_attach = on_attach,
--     filetypes = { "html", "javascriptreact", "typescriptreact", "astro", "svelte" },
--     root_dir = vim.fs.root(0, { "tailwind.config.js", "tailwind.config.cjs", "postcss.config.js", ".git" }),
-- })
--
-- -- Python (basedpyright)
-- vim.lsp.start({
--     name = "basedpyright",
--     cmd = { "basedpyright-langserver", "--stdio" },
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = {
--         basedpyright = {
--             analysis = {
--                 autoSearchPaths = true,
--                 diagnosticMode = "openFilesOnly",
--                 useLibraryCodeForTypes = true,
--             },
--         },
--     },
--     root_dir = vim.fs.root(0, { "pyproject.toml", "setup.py", ".git" }),
-- })
--
-- -- PHP (intelephense)
-- vim.lsp.start({
--     name = "intelephense",
--     cmd = { "intelephense", "--stdio" },
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = {
--         intelephense = {
--             stubs = {
--                 "apache","bcmath","bz2","calendar","com_dotnet","Core","ctype","curl","date","dba",
--                 "dom","enchant","exif","FFI","fileinfo","filter","fpm","ftp","gd","gettext","gmp",
--                 "hash","iconv","imap","intl","json","ldap","libxml","mbstring","meta","mysqli","oci8",
--                 "odbc","openssl","pcntl","pcre","PDO","pdo_ibm","pdo_mysql","pdo_pgsql","pdo_sqlite",
--                 "pgsql","Phar","posix","pspell","readline","Reflection","session","shmop","SimpleXML",
--                 "snmp","soap","sockets","sodium","SPL","sqlite3","standard","superglobals","sysvmsg",
--                 "sysvsem","sysvshm","tidy","tokenizer","xml","xmlreader","xmlrpc","xmlwriter","xsl",
--                 "Zend OPcache","zip","zlib","wordpress","phpunit",
--             },
--             diagnostics = {
--                 enable = true,
--             },
--             format = {
--                 enable = false,
--             },
--         },
--     },
--     root_dir = vim.fs.root(0, { "composer.json", ".git" }),
-- })
--
-- -- Otros servidores generales
-- for _, server in ipairs({ "bashls", "marksman", "biome", "cssls", "html", "astro", "kulala_ls", "prismals" }) do
--     vim.lsp.start({
--         name = server,
--         cmd = { server },
--         capabilities = capabilities,
--         on_attach = on_attach,
--         root_dir = vim.fs.root(0, { ".git" }),
--     })
-- end
-- nd
