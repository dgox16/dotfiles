local lspconfig = require("lspconfig")
require("lspconfig").tsserver.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  cmd = { "typescript-language-server", "--stdio" },
  -- I needed this to work on plain .js files
  root_dir = function()
    return vim.loop.cwd()
  end,
})
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.texlab.setup{}
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').html.setup {
    capabilities = capabilities,
    filetypes = {
        "html",
        "handlebars"
    },
}
require'lspconfig'.cssls.setup {
    capabilities = capabilities,
}
require'lspconfig'.jsonls.setup {
    capabilities = capabilities,
}
