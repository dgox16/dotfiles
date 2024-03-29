return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle reveal<cr>" },
        },
        config = function()
            require("configs.neo-tree")
        end,
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
        dependencies = { "MunifTanjim/nui.nvim" },
        ft = "hurl",
        opts = {
            debug = false,
            -- Show notification on run
            show_notification = false,
            -- Show response in popup or split
            mode = "split",
            -- Default formatter
            formatters = {
                json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
                html = {
                    "prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
                    "--parser",
                    "html",
                },
            },
        },
        keys = {
            -- Run API request
            { "<leader>A", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
            { "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
            { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
            { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
            { "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
            -- Run Hurl request in visual mode
            { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
        },
    },

    {

        "folke/trouble.nvim",
        lazy = true,
        cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
        opts = { use_diagnostic_signs = true },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
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
