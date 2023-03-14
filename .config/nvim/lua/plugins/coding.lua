return {
    {
        "numToStr/Comment.nvim",
        keys = { "gc", { "gc", mode = "x" } },
        config = true,
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        keys = { "cs", "ys", "ds" },
        config = true,
    },

    {
        "phaazon/hop.nvim",
        cmd = "HopWord",
        keys = { { "m", "<cmd>HopWord<cr>" } },
        opts = {
            keys = "etovxqpdygfblzhckisuran",
        },
    },

    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        opts = {
            mapping = { "jk" },
        },
    },
}
