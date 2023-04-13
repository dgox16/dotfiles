return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    dependencies = {
        "HiPhish/nvim-ts-rainbow2",
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/playground",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "lua",
                "vim",
                "regex",
                "markdown",
                "markdown_inline",
                "json",
                "http",
                "yaml",
                "latex",
                "python",
                "rust",
                "html",
                "javascript",
                "typescript",
                "css",
            },
            autotag = { enable = true },
            indent = {
                enable = true,
                disable = { "python" },
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            rainbow = {
                enable = true,
                max_file_lines = 3000,
                strategy = require("ts-rainbow.strategy.global"),
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<nop>",
                    node_decremental = "<bs>",
                },
            },
        })
    end,
    build = ":TSUpdate",
}
