local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
}
dashboard.section.header.opts.hl = "AlphaHeader"

local function button(sc, txt, leader_txt, keybind, keybind_opts)
    local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }

    if nil == keybind then
        keybind = sc_after
    end

    keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_after, keybind, keybind_opts }

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local leader = " "
dashboard.section.buttons.val = {
    button("space f f", "  Find File  ", leader, ":Telescope find_files<cr>"),
    button("space f o", "  Recent File  ", leader, ":Telescope oldfiles<CR>"),
    button("space f w", "  Find Word  ", leader, ":Telescope live_grep<CR>"),
    button("space f n", "  New File  ", leader, "<CMD>ene!<CR>"),
    button("space e s", "  Settings", leader, ":e $MYVIMRC | :cd %:p:h <CR>"),
}
dashboard.section.buttons.opts.hl = "String"

local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    return "   Have fun with Neovim"
        .. "   v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "   "
        .. total_plugins
        .. " plugins"
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "AlphaFooter"

local head_butt_padding = 2
local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.40))
local foot_butt_padding = 1

dashboard.config.layout = {
    { type = "padding", val = header_padding },
    dashboard.section.header,
    { type = "padding", val = head_butt_padding },
    dashboard.section.buttons,
    { type = "padding", val = foot_butt_padding },
    dashboard.section.footer,
}

alpha.setup(dashboard.opts)

vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#b4befe" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        local old_laststatus = vim.opt.laststatus
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = old_laststatus
            end,
        })
        vim.opt.laststatus = 0
    end,
})
