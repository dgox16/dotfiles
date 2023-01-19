local gitsigns = require("gitsigns")
return gitsigns.setup({
    signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = {
            hl = "GitSignsChange",
            text = "│",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
        },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = {
            hl = "GitSignsDelete",
            text = "│",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
        },
        changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        untracked = {
            hl = "GitSignsUntracked",
            text = "│",
            numhl = "GitSignsUntrackedNr",
            linehl = "GitSignsUntrackedLn",
        },
    },
    diff_opts = { internal = true },
    preview_config = { border = "rounded" },
})
