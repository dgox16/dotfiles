local luasnip = require("luasnip")

local options = {
    history = true,
    update_events = "InsertLeave",
    enable_autosnippets = true,
    region_check_events = "CursorHold,InsertLeave",
    delete_check_events = "TextChanged,InsertEnter",
    store_selection_keys = "<Tab>",
}

luasnip.config.set_config(options)
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        if
            require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require("luasnip").session.jump_active
        then
            require("luasnip").unlink_current()
        end
    end,
})

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
