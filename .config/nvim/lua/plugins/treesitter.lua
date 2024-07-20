return {
    {

        "nvim-treesitter/nvim-treesitter",
        dependencies = {},
        config = function()
            require("configs.treesitter")
        end,
        build = ":TSUpdate",
    },

    { "virchau13/tree-sitter-astro", ft = "astro" },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {

        "windwp/nvim-ts-autotag",
        config = true,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
