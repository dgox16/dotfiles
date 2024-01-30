require("bufferline").setup({
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
})
