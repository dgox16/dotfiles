return {
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- {
    --     "luukvbaal/statuscol.nvim",
    --     config = function()
    --         require("statuscol").setup()
    --     end,
    -- },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        opts = {
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
            show_trailing_blankline_indent = false,
            show_current_context = true,
        },
    },

    {
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPost",
        opts = {
            user_default_options = {
                names = false,
            },
        },
    },

    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },

    {
        "RRethy/vim-illuminate",
        event = "BufReadPost",
        opts = { delay = 200 },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },
}
