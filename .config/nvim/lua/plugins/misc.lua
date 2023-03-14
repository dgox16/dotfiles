return {
    {
        "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
    {
        "lambdalisue/suda.vim",
        cmd = { "SudaRead", "SudaWrite" },
    },
    {
        "adalessa/markdown-preview.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = true,
        ft = "markdown",
    },
}
