return {
    {
        "echasnovski/mini.files",
        version = false,
        keys = {
            { "-", "<cmd>lua require('mini.files').open(vim.api.nvim_buf_get_name(0))<CR>", { silent = true } },
        },
    },
    {
        "nosduco/remote-sshfs.nvim",
        cmd = { "RemoteSSHFSConnect" },
        opts = {
            ui = {
                confirm = {
                    connect = false,
                },
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble" },
        event = { "BufReadPost", "BufNewFile" },
        config = true,
        keys = {
            {
                "<leader>st",
                function()
                    Snacks.picker.todo_comments()
                end,
                desc = "Todo",
            },
        },
    },

    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            picker = {},
            lazygit = {},
            terminal = {},
        },
        keys = {
            -- Lazygit
            {
                "<leader>gg",
                function()
                    Snacks.lazygit()
                end,
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

    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm" },
        version = "v2.*",
        keys = {
            { "<M-q>", "<cmd>ToggleTerm<CR>", mode = "n" },
            { "<leader>gg" },
        },
        config = function()
            require("configs.toggleterm")
        end,
    },

    {
        "folke/flash.nvim",
        opts = {},
        -- stylua: ignore
        keys = {
           { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
           { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
           { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
           { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
           { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    {
        "mistweaverco/kulala.nvim",
        opts = {},
        keys = {
            { "<leader>a", "<cmd>lua require('kulala').run()<CR>" },
        },
    },

    {

        "folke/trouble.nvim",
        lazy = true,
        cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
        opts = { use_diagnostic_signs = true },
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Document Diagnostics (Trouble)" },
        },
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            diff_opts = { internal = true },
            preview_config = { border = "rounded" },
        },
    },
}
