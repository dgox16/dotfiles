return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        { "MunifTanjim/nui.nvim", lazy = true },
        "rcarriga/nvim-notify",
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
                enabled = false,
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
    },
}
