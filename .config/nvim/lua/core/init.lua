local disable_providers = function()
    local default_providers = {
        "node",
        "perl",
        "python3",
        "ruby",
    }

    for _, provider in ipairs(default_providers) do
        vim.g["loaded_" .. provider .. "_provider"] = 0
    end
end

local leader_map = function()
    vim.api.nvim_set_keymap("n", "<Space>", "", { noremap = true })
    vim.api.nvim_set_keymap("x", "<Space>", "", { noremap = true })
    vim.g.maplocalleader = " "
    vim.g.mapleader = " "
end

local clipboard_config = function()
    vim.g.clipboard = {
        name = "xsel",
        copy = {
            ["+"] = "xsel --nodetach -i -b",
            ["*"] = "xsel --nodetach -i -p",
        },
        paste = {
            ["+"] = "xsel -o -b",
            ["*"] = "xsel -o -p",
        },
        cache_enabled = 1,
    }
end

local load_core = function()
    disable_providers()
    leader_map()
    clipboard_config()

    require("core.events")
    require("core.options")
    require("core.keymappings")
end

load_core()
