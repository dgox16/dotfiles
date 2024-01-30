return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {

            {
                "williamboman/mason.nvim",
                lazy = true,
                config = function()
                    require("configs.mason")
                end,
            },
            "hrsh7th/cmp-nvim-lsp",
            "barreiroleo/ltex-extra.nvim",
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

        {
            "barreiroleo/ltex_extra.nvim",
            dev = false,
            ft = { "markdown", "tex" },
            opts = {
                log_level = "error",
                server_opts = {
                    on_attach = function(client, bufnr) end,
                    filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
                    settings = {
                        ltex = {
                            language = "es",
                            checkFrequency = "save",
                            additionalRules = {
                                enablePickyRules = true,
                                motherTongue = "es",
                            },
                        },
                    },
                },
            },
        },
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
