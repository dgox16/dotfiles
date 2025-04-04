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
        ft = "http",
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
