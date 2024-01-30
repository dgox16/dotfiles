return {
    {
        "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },

    {
        "fladson/vim-kitty",
        ft = "kitty",
    },

    {
        "lambdalisue/suda.vim",
        cmd = { "SudaRead", "SudaWrite" },
    },

    {
        "LunarVim/bigfile.nvim",
        event = "VeryLazy",
    },

    {
        "folke/zen-mode.nvim",
        cmd = { "ZenMode" },
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}
