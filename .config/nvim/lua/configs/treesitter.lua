require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua",
        "vim",
        "regex",
        "markdown",
        "markdown_inline",
        "json",
        "http",
        "python",
        "html",
        "html",
        "javascript",
        "typescript",
        "css",
    },
    auto_install = true,
    autotag = {
        enable = true,
        filetypes = {
            "html",
            "javascript",
            "typescript",
            "svelte",
            "vue",
            "rescript",
            "xml",
            "php",
            "markdown",
            "astro",
            "glimmer",
            "handlebars",
            "hbs",
        },
    },
    indent = {
        enable = true,
        disable = { "python" },
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- rainbow = {
    --     enable = true,
    --     strategy = require("ts-rainbow.strategy.global"),
    -- },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<nop>",
            node_decremental = "<bs>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,

            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
                ["@parameter.outer"] = "v",
                ["@function.outer"] = "V",
                ["@class.outer"] = "<c-v>",
            },
            include_surrounding_whitespace = true,
        },
    },
})
