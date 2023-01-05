local M = {}

M.plugins = {

    -- UI
    { "kyazdani42/nvim-web-devicons" },

    {
        "catppuccin/nvim",
        as = "catppuccin",
        run = ":CatppuccinCompile",
        config = function()
            require("configs.ui.catppuccin")
        end,
    },

    {
        "hoob3rt/lualine.nvim",
        after = "nvim-lspconfig",
        config = function()
            require("configs.ui.lualine")
        end,
    },

    {
        "goolord/alpha-nvim",
        opt = true,
        event = "BufWinEnter",
        config = function()
            require("configs.ui.alpha")
        end,
    },

    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("configs.ui.nvim_tree")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("configs.ui.gitsigns")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        setup = function()
            require("configs.ui.indent_blankline")
        end,
    },

    {
        "akinsho/bufferline.nvim",
        event = "BufWinEnter",
        tag = "*",
        config = function()
            require("configs.ui.bufferline")
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = function()
            require("configs.ui.colorizer")
        end,
    },

    { "stevearc/dressing.nvim" },

    -- Editor
    {
        "numToStr/Comment.nvim",
        event = "BufReadPost",
        config = function()
            require("configs.editor.comment")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        config = function()
            require("configs.editor.treesitter")
        end,
        run = ":TSUpdate",
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    },

    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        after = "nvim-treesitter",
    },

    {
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    },

    {
        "kylechui/nvim-surround",
        tag = "*",
        event = "BufReadPost",
        config = function()
            require("configs.editor.surround")
        end,
    },

    {
        "phaazon/hop.nvim",
        event = "BufReadPost",
        config = function()
            require("configs.editor.hop")
        end,
    },

    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("configs.editor.better_escape")
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter",
    },

    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm", "lua _lazygit_toggle()" },
        tag = "v2.*",
        config = function()
            require("configs.editor.toggleterm")
        end,
    },

    -- Completion

    {
        "barreiroleo/ltex-extra.nvim",
        event = "BufReadPre",
    },

    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        config = function()
            require("configs.completion.lsp")
        end,
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("configs.completion.mason")
        end,
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("configs.completion.lspsaga")
        end,
    },

    {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("configs.completion.cmp")
        end,
        requires = {
            { "onsails/lspkind.nvim" },
            { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
            { "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
            { "hrsh7th/cmp-path", after = "cmp-nvim-lua" },
            { "hrsh7th/cmp-buffer", after = "cmp-path" },
            { "hrsh7th/cmp-cmdline", after = "cmp-buffer" },
        },
    },

    {
        "L3MON4D3/LuaSnip",
        after = "nvim-cmp",
        config = function()
            require("configs.completion.luasnip")
        end,
    },

    {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function()
            require("configs.completion.autopairs")
        end,
    },

    {
        "rafamadriz/friendly-snippets",
        after = "nvim-cmp",
        module = { "cmp", "cmp_nvim_lsp" },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        config = function()
            require("configs.completion.null_ls")
        end,
    },

    -- Tools
    { "nvim-lua/plenary.nvim" },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("configs.tools.telescope")
        end,
    },

    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
        config = function()
            require("configs.tools.trouble")
        end,
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        after = "telescope.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },

    {
        "NTBBloodbath/rest.nvim",
        ft = "http",
        config = function()
            require("configs.tools.rest")
        end,
    },

    {
        "lambdalisue/suda.vim",
        cmd = { "SudaRead", "SudaWrite" },
    },

    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    },

    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            require("configs.tools.md_preview")
        end,
        ft = { "markdown" },
    },
}

return vim.tbl_extend("error", M, {})
