return {
    cmd = { "vtsls", "--stdio" },
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
