return {
    {

        "nvim-treesitter/nvim-treesitter",
        -- event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            {

                "windwp/nvim-ts-autotag",
                config = true,
            },
        },
        config = function()
            require("configs.treesitter")
        end,
        build = ":TSUpdate",
    },

    { "virchau13/tree-sitter-astro", ft = "astro" },
}
