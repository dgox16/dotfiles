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
