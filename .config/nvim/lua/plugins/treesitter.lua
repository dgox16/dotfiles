return {
    {

        "nvim-treesitter/nvim-treesitter",
        -- event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("configs.treesitter")
        end,
        build = ":TSUpdate",
    },

    { "virchau13/tree-sitter-astro", ft = "astro" },
}
