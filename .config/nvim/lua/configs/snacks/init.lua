local dashboard = require("configs.snacks.dashboard")

require("snacks").setup({
    dashboard = dashboard.opts,
    bigfile = {},
    bufdelete = {},
    indent = {},
    input = {},
    lazygit = {
        theme = {
            [241] = { fg = "Special" },
            activeBorderColor = { fg = "MatchParen", bold = true },
            cherryPickedCommitBgColor = { fg = "Identifier" },
            cherryPickedCommitFgColor = { fg = "Function" },
            defaultFgColor = { fg = "Normal" },
            inactiveBorderColor = { fg = "LazyDimmed" },
            optionsTextColor = { fg = "Function" },
            searchingActiveBorderColor = { fg = "MatchParen", bold = true },
            selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
            unstagedChangesColor = { fg = "DiagnosticError" },
        },
    },
    notifier = {},
    quickfile = { enabled = true },
    picker = {},
    zen = {},
})
