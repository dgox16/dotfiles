local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_config.setup({
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
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
            typescript = "// %s",
            css = "/* %s */",
            scss = "/* %s */",
            html = "<!-- %s -->",
            svelte = "<!-- %s -->",
            vue = "<!-- %s -->",
            json = "",
        },
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
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]["] = "@function.outer",
                ["]m"] = "@class.outer",
            },
            goto_next_end = {
                ["]]"] = "@function.outer",
                ["]M"] = "@class.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
                ["[m"] = "@class.outer",
            },
            goto_previous_end = {
                ["[]"] = "@function.outer",
                ["[M"] = "@class.outer",
            },
        },
    },
})
