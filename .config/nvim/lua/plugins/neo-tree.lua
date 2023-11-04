return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle reveal<cr>" },
        },
        opts = {
            close_if_last_window = true,
            enable_diagnostics = false,
            default_component_configs = {
                indent = { padding = 0 },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    default = "",
                },
                git_status = {
                    symbols = {
                        added = "",
                        deleted = "",
                        modified = "",
                        renamed = "",
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            window = {
                width = 35,
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                hijack_netrw_behavior = "open_current",
                use_libuv_file_watcher = true,
            },
            event_handlers = {
                {
                    event = "neo_tree_buffer_enter",
                    handler = function(_)
                        vim.opt_local.signcolumn = "auto"
                    end,
                },
            },
        },
    },
}
