return {
    {
        "hoob3rt/lualine.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("configs.lualine")
        end,
    },

    {
        "goolord/alpha-nvim",
        event = "BufWinEnter",
        config = function()
            require("configs.alpha")
        end,
    },

    {
        "akinsho/bufferline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>bv", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true } },
            { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>" },
            { "<leader>br", "<Cmd>BufferLineCloseRight<CR>" },
            { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>" },
            { "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true } },
            { "<tab>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true } },
        },
        config = function()
            require("configs.bufferline")
        end,
        dependencies = {
            {
                "echasnovski/mini.bufremove",
                keys = {
                    {
                        "<leader>bd",
                        function()
                            require("mini.bufremove").delete(0, false)
                        end,
                        desc = "Delete Buffer",
                    },
                    {
                        "<leader>bD",
                        function()
                            require("mini.bufremove").delete(0, true)
                        end,
                        desc = "Delete Buffer (Force)",
                    },
                },
            },
        },
    },

    { "nvim-tree/nvim-web-devicons", lazy = true },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            exclude = {
                filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
            },
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
        "hiphish/rainbow-delimiters.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local rainbow_delimiters = require("rainbow-delimiters")
            vim.g.rainbow_delimiters = {
                strategy = {
                    [""] = rainbow_delimiters.strategy["global"],
                    vim = rainbow_delimiters.strategy["local"],
                },
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-blocks",
                },
            }
        end,
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

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            { "MunifTanjim/nui.nvim", lazy = true },
            {
                "rcarriga/nvim-notify",
                lazy = true,
                event = "VeryLazy",
                keys = {
                    {
                        "<leader>un",
                        function()
                            require("notify").dismiss({ silent = true, pending = true })
                        end,
                        desc = "Delete all Notifications",
                    },
                },
                opts = {
                    timeout = 3000,
                    max_height = function()
                        return math.floor(vim.o.lines * 0.75)
                    end,
                    max_width = function()
                        return math.floor(vim.o.columns * 0.75)
                    end,
                },
            },
        },
        opts = {
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
            lsp = {
                progress = {
                    enabled = true,
                    -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                    -- See the section on formatting for more details on how to customize.
                    --- @type NoiceFormat|string
                    format = "lsp_progress",
                    --- @type NoiceFormat|string
                    format_done = "lsp_progress_done",
                    throttle = 1000 / 30, -- frequency to update lsp progress message
                    view = "mini",
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
        },
    },
}
