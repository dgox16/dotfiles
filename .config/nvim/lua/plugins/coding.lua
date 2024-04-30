return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "onsails/lspkind.nvim",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
        },
        config = function()
            require("configs.cmp")
        end,
    },
    {
        "chrisgrieser/nvim-various-textobjs",
        event = "BufReadPost",
        opts = { useDefaultKeymaps = true },
    },

    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        config = function()
            require("configs.luasnip")
        end,
    },

    {
        "gbprod/yanky.nvim",
        event = "BufReadPost",
        keys = {
            { "<C-n>", "<Plug>(YankyCycleForward)" },
            { "<C-p>", "<Plug>(YankyCycleBackward)" },
            {
                "<leader>p",
                function()
                    require("telescope").extensions.yank_history.yank_history({})
                end,
                desc = "Open Yank History",
            },
            { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
            { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
            { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
            { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
            { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
        },
        opts = {
            highlight = {
                timer = 150,
            },
        },
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
            -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            -- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },

    {
        "numToStr/Comment.nvim",
        keys = { "gc", { "gc", mode = "x" } },
        config = true,
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        keys = { "cs", "ys", "ds" },
        opts = {
            aliases = {
                ["b"] = ")",
                ["a"] = "{",
                ["r"] = "]",
                ["q"] = { '"', "'", "`" },
            },
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
