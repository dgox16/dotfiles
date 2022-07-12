vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup({
    function(use)
        -- Packer can manage itself
        use("wbthomason/packer.nvim")
        -- lsp
        use("neovim/nvim-lspconfig")
        use("williamboman/nvim-lsp-installer")
        -- Autocomplete
        use({
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-cmdline", -- command line
                "hrsh7th/cmp-buffer", -- buffer completions
                "hrsh7th/cmp-nvim-lua", -- nvim config completions
                "hrsh7th/cmp-nvim-lsp", -- lsp completions
                "hrsh7th/cmp-path", -- file path completions
                "saadparwaiz1/cmp_luasnip", -- snippets completions
            },
        })
        use({
            "catppuccin/nvim",
            as = "catppuccin",
        })

        -- Treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        })

        -- LuaLine
        use({
            "hoob3rt/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        })

        -- snippets
        use({
            "L3MON4D3/LuaSnip",
            requires = {
                "rafamadriz/friendly-snippets",
            },
        })

        -- tpope
        use("tpope/vim-commentary")
        use("tpope/vim-surround")

        -- windwp
        use("windwp/nvim-ts-autotag") -- auto close and rename tags
        use("windwp/nvim-autopairs")

        -- Formatting
        use("mhartington/formatter.nvim")

        use("airblade/vim-gitgutter")

        -- hightlight matching tag in html,jsx etc.
        use("leafOfTree/vim-matchtag")

        use("ibhagwan/fzf-lua")

        -- file tree
        use({
            "kyazdani42/nvim-tree.lua",
            requires = { "kyazdani42/nvim-web-devicons" },
        })

        -- icons in completion
        use("onsails/lspkind-nvim")

        -- Colorizer
        use("norcalli/nvim-colorizer.lua")

        -- bufferline for buffers in 'tabs'
        use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })
        use({ "akinsho/toggleterm.nvim", tag = "v2.*" })
    end,
})
