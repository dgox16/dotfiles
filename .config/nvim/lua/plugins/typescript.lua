return {
    {
        "jose-elias-alvarez/typescript.nvim",
        ft = { "javascript", "javascriptreact" },
        opts = {
            disable_commands = false,
            debug = false,
            go_to_source_definition = {
                fallback = true,
            },
            server = {
                on_attach = ...,
            },
        },
    },
}
