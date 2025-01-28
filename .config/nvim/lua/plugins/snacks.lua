return {
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("configs.snacks")
        end,
        keys = {
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
