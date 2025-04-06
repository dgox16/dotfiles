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
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
        opts = {},
        ft = "markdown",
    },
}
