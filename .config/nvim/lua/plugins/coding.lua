return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        version = "*",
        config = function()
            require("configs.blink")
        end,
        opts_extend = { "sources.default" },
    },

    {
        "chrisgrieser/nvim-various-textobjs",
        event = "BufReadPost",
        opts = {
            keymaps = {
                useDefaults = true,
            },
        },
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
        config = true,
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
    },

    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        opts = {
            k = function()
                vim.api.nvim_input("<esc>")
                local current_line = vim.api.nvim_get_current_line()
                if current_line:match("^%s+j$") then
                    vim.schedule(function()
                        vim.api.nvim_set_current_line("")
                    end)
                end
            end,
        },
    },
}
