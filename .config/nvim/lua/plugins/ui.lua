return {
    {
        "hoob3rt/lualine.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("configs.lualine")
        end,
    },

    {
        -- dir = "~/Documents/projects_neovim/devicon-colorscheme.nvim/",
        "dgox16/devicon-colorscheme.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            colors = {
                blue = "#92a2d5",
                cyan = "#85b5ba",
                green = "#90b99f",
                magenta = "#e29eca",
                orange = "#f5a191",
                purple = "#aca1cf",
                red = "#ea83a5",
                white = "#c9c7cd",
                yellow = "#e6b99d",
                bright_blue = "#a7b3dd",
                bright_cyan = "#97c0c4",
                bright_green = "#a7c8b3",
                bright_magenta = "#e8b0d4",
                bright_orange = "#f6b0a2",
                bright_purple = "#b7aed5",
                bright_red = "#ed96b3",
                bright_yellow = "#eac5ae",
            },
        },
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
            { "<leader>bb", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true } },
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

    {
        "nvim-tree/nvim-web-devicons",
        config = true,
    },

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

    { "echasnovski/mini.cursorword", event = { "BufReadPost", "BufNewFile" }, config = true },

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
                    format = "lsp_progress",
                    format_done = "lsp_progress_done",
                    throttle = 1000 / 30,
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
