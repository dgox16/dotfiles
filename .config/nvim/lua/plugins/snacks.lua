return {
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("configs.snacks")
        end,
        keys = {
            -- Explorer
            {
                "<leader>e",
                function()
                    Snacks.explorer()
                end,
                desc = "File Explorer",
            },
            -- Bufdelete
            {
                "<leader>bd",
                function()
                    Snacks.bufdelete()
                end,
                desc = "Delete Buffer",
            },
            -- Zen
            {
                "<leader>z",
                function()
                    Snacks.zen()
                end,
                desc = "Toggle Zen Mode",
            },
            -- Lazygit
            {
                "<leader>gg",
                function()
                    Snacks.lazygit()
                end,
            },
            -- Picker
            --
            {
                "<leader>gd",
                function()
                    Snacks.picker.git_diff()
                end,
                desc = "Git Diff (Hunks)",
            },
            {
                "<leader>,",
                function()
                    Snacks.picker.buffers()
                end,
                desc = "Buffers",
            },
            {
                "<leader>/",
                function()
                    Snacks.picker.lines()
                end,
                desc = "Grep",
            },
            {
                "<leader><space>",
                function()
                    Snacks.picker.smart()
                end,
                desc = "Smart Find Files",
            },
            {
                "<leader>:",
                function()
                    Snacks.picker.command_history()
                end,
                desc = "Command History",
            },

            {
                "<leader>ff",
                function()
                    Snacks.picker.files()
                end,
                desc = "Find Files",
            },

            {
                "<leader>fh",
                function()
                    Snacks.picker.files({ hidden = true, ignored = true })
                end,
                desc = "Find Files",
            },

            {
                "<leader>fc",
                function()
                    Snacks.picker.cliphist()
                end,
            },
            {
                "<leader>fw",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Visual selection or word",
                mode = { "n", "x" },
            },
            {
                "<leader>gl",
                function()
                    Snacks.picker.git_log()
                end,
                desc = "Git Log",
            },
        },
    },
}
