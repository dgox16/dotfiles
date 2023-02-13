return {
    {
        "akinsho/bufferline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        version = "*",
        config = function()
            local opts = {
                options = {
                    number = nil,
                    max_name_length = 14,
                    max_prefix_length = 13,
                    tab_size = 20,
                    show_buffer_close_icons = true,
                    show_buffer_icons = true,
                    show_tab_indicators = true,
                    diagnostics = "nvim_lsp",
                    always_show_bufferline = true,
                    separator_style = "thin",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Neo-tree",
                            highlight = "Directory",
                            text_align = "left",
                        },
                    },
                    diagnostics_indicator = function(count)
                        return "(" .. count .. ")"
                    end,
                },
                highlights = require("catppuccin.groups.integrations.bufferline").get(),
            }

            require("bufferline").setup(opts)

            vim.api.nvim_set_keymap("n", "<M-h>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<M-l>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>ñ", ":BufferLinePick<CR>", { noremap = true, silent = true })
        end,
    },
}
