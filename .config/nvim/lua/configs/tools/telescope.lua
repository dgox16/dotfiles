vim.api.nvim_command([[packadd telescope-fzf-native.nvim]])

require("telescope").setup({
    defaults = {
        entry_prefix = " ",
        -- preview = false,
        scroll_strategy = "limit",
        path_display = { "absolute" },
        layout_config = {
            prompt_position = "bottom",
            horizontal = {
                preview_width = 0.5,
            },
        },
        file_ignore_patterns = {
            ".git/",
            "node_modules/",
        },
        dynamic_preview_title = true,
        vimgrep_arguments = {
            "rg",
            "--ignore",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})
require("telescope").load_extension("fzf")
