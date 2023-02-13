return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    keys = {
        { "<c-space>", desc = "Increment selection" },
        { "<bs>", desc = "Schrink selection", mode = "x" },
    },
    dependencies = {
        "p00f/nvim-ts-rainbow",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "lua",
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
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = 2000,
            },
        })
    end,
    build = ":TSUpdate",
}
