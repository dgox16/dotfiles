require("blink.cmp").setup({
    keymap = {
        preset = "enter",

        ["<M-enter>"] = {
            function(cmp)
                cmp.show({ providers = { "lsp", "path", "snippets", "buffer" } })
            end,
        },
    },
    cmdline = {
        keymap = {
            preset = "none",
        },
    },
    completion = {
        menu = {
            border = "rounded",
            scrollbar = false,
            auto_show = function(ctx)
                return ctx.mode ~= "cmdline"
            end,
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
