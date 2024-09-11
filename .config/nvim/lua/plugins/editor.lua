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
        dependencies = { "nvim-telescope/telescope.nvim" },
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
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = { "BufReadPost", "BufNewFile" },
        config = true,
        keys = {
            { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
        },
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            {
                "<leader>,",
                "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
                desc = "Switch Buffer",
            },
            -- find
            { "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true } },
            { "<leader>fh", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>" },
            { "<leader>fo", "<cmd>Telescope oldfiles<CR>" },
            { "<leader>fw", "<cmd>Telescope live_grep <CR>" },
            { "<leader>fc", "<cmd>Telescope colorscheme <CR>" },
            { "<leader>ft", "<cmd>Telescope treesitter<CR>" },
            -- git
            { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
            { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
            -- search
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find case_mode=ignore_case<CR>" },
        },
        dependencies = {
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("configs.telescope")
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
        "jellydn/hurl.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "hurl" },
        opts = {
            debug = false,
            show_notification = false,
            mode = "split",
            formatters = {
                json = { "jq" },
                html = {
                    "prettier",
                    "--parser",
                    "html",
                },
            },
        },
        keys = {
            { "<leader>A", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
            { "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
            { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
            { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
            { "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
            { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
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
