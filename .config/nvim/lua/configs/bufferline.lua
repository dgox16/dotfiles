require("bufferline").setup({
    options = {
        close_command = function(n)
            Snacks.bufdelete.delete()
        end,
        right_mouse_command = function(n)
            Snacks.bufdelete.delete()
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
                highlight = "Directory",
                text_align = "left",
            },
        },
    },
})
