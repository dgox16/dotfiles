require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "lua:configs.mason.custom_source",
    },
    ui = {
        icons = {
            package_pending = "󰥔 ",
            package_installed = " ",
            package_uninstalled = "󰅙 ",
        },

        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
            cancel_installation = "<C-c>",
        },
    },
    max_concurrent_installers = 10,
})
