return {
    {
        "akinsho/bufferline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>bv", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true } },
            { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true } },
            { "<S-l>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true } },
        },
        version = "*",
        config = function()
            local opts = {
                options = {
                    close_command = function(n)
                        require("mini.bufremove").delete(n, false)
                    end,
                    right_mouse_command = function(n)
                        require("mini.bufremove").delete(n, false)
                    end,
                    diagnostics = "nvim_lsp",
                    always_show_bufferline = true,
                    buffer_close_icon = "",
                    modified_icon = "",
                    close_icon = "",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Neo-tree",
                            highlight = "Directory",
                            text_align = "left",
                        },
                    },
                },
                highlights = require("catppuccin.groups.integrations.bufferline").get(),
            }
            require("bufferline").setup(opts)
        end,
    },
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
}
