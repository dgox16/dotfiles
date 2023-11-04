return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true } },
            { "<leader>fh", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>" },
            { "<leader>fo", "<cmd>Telescope oldfiles<CR>" },
            { "<leader>fw", "<cmd>Telescope live_grep <CR>" },
            { "<leader>ft", "<cmd>Telescope treesitter<CR>" },
            { "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find case_mode=ignore_case<CR>" },
        },
        dependencies = {
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    entry_prefix = " ",
                    scroll_strategy = "limit",
                    prompt_prefix = "   ",
                    path_display = { "truncate" },
                    winblend = 0,
                    border = {},
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    layout_config = {
                        horizontal = {
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                    file_ignore_patterns = {
                        ".git/",
                        "venv",
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
        end,
    },
}
