return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = function()
                    require("configs.mason")
                end,
            },
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            { "folke/neodev.nvim", config = true },
        },
        keys = {
            { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true } },
            { "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true } },
            { "g{", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true } },
            { "g}", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true } },
            { "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true } },
            { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true } },
            { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true } },
            { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true } },
            { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true } },
        },
        config = function()
            require("configs.lsp")
        end,
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        lazy = false,
    },

    {
        "pmizio/typescript-tools.nvim",
        event = "BufReadPre",

        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {
            settings = {
                jsx_close_tag = {
                    enable = true,
                    filetypes = { "javascriptreact", "typescriptreact" },
                },
            },
        },
    },
}
