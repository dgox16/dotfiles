local servers = { "vtsls", "luals", "biome" }

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
})

vim.api.nvim_create_user_command("LspRestart", function()
    local clients = vim.lsp.get_clients()
    for _, c in ipairs(clients) do
        c:stop()
    end
    vim.lsp.enable(servers)
end, {})

vim.lsp.enable(servers)
