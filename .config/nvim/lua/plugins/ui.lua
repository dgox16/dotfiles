return {
    {
        "hoob3rt/lualine.nvim",
        event = "VeryLazy",
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                vim.o.statusline = " "
            else
                vim.o.laststatus = 0
            end
        end,
        config = function()
            require("configs.lualine")
        end,
    },

    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
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
    },

    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
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
