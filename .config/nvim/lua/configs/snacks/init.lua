local dashboard = require("configs.snacks.dashboard")

require("snacks").setup({
    dashboard = dashboard.opts,
    bigfile = {},
    bufdelete = {},
    indent = {},
    input = {},
    lazygit = {},
    notifier = {},
    quickfile = { enabled = true },
    picker = {},
    zen = {},
})
