return {

    -- UI
    { "kyazdani42/nvim-web-devicons" },

    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        as = "catppuccin",
        run = ":CatppuccinCompile",
        config = function()
            require("configs.ui.catppuccin")
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                opts = {
                    timeout = 1000,
                    max_height = function()
                        return math.floor(vim.o.lines * 0.75)
                    end,
                    max_width = function()
                        return math.floor(vim.o.columns * 0.75)
                    end,
                },
            },
        },
        config = function()
            require("configs.ui.noice")
        end,
    },

    {
        "hoob3rt/lualine.nvim",
        event = { "BufReadPost", "BufNewFile" },
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
        event = { "BufReadPost" },
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
        event = { "BufReadPost", "BufNewFile" },
        version = "*",
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

    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },

    -- Editor
    {
        "numToStr/Comment.nvim",
        keys = { "gc", { "gc", mode = "x" } },
        config = function()
            require("configs.editor.comment")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        dependencies = {

            "p00f/nvim-ts-rainbow",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            require("configs.editor.treesitter")
        end,
        run = ":TSUpdate",
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        keys = { "cs", "ys", "ds" },
        config = function()
            require("configs.editor.surround")
        end,
    },

    {
        "phaazon/hop.nvim",
        cmd = "HopWord",
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
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm" },
        version = "v2.*",
        config = function()
            require("configs.editor.toggleterm")
        end,
    },

    -- Completion
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "barreiroleo/ltex-extra.nvim",
        },
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
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("configs.completion.cmp")
        end,
        dependencies = {
            "onsails/lspkind.nvim",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
        },
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("configs.completion.autopairs")
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("configs.completion.luasnip")
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        config = function()
            require("configs.completion.null_ls")
        end,
    },

    -- Tools
    {
        "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("configs.tools.telescope")
        end,
    },

    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle" },
        config = function()
            require("configs.tools.trouble")
        end,
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
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        setup = function()
            require("configs.tools.md_preview")
        end,
        ft = { "markdown" },
    },
}
