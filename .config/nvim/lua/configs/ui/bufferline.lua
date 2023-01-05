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
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                padding = 1,
            },
        },
        diagnostics_indicator = function(count)
            return "(" .. count .. ")"
        end,
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
}

require("bufferline").setup(opts)
