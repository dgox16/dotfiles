require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
        menu = {
            border = "rounded",
            scrollbar = false,
        },
        documentation = {
            auto_show = true,
            window = {
                border = "rounded",
            },
        },
    },

    appearance = {
        nerd_font_variant = "mono",
    },
    snippets = { preset = "luasnip" },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
})
