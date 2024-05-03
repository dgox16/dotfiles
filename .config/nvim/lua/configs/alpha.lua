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
        hl_shortcut = "AlphaShortcut",
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
    button("space f f", "  Find File  ", leader, ":Telescope find_files<CR>"),
    button("space f h", "󰗹  Find Hidden File  ", leader, ":Telescope find_files hidden=true no_ignore=true<CR>"),
    button("space f o", "󱋡  Recent File  ", leader, ":Telescope oldfiles<CR>"),
    button("space f w", "󱀽  Find Word  ", leader, ":Telescope live_grep<CR>"),
    button("space f n", "󱇧  New File  ", leader, ":ene <BAR> startinsert <CR>"),
    button("space n", "  Settings", leader, ":e $MYVIMRC | :cd %:p:h <CR>"),
    button("space l", "󰒲  Lazy", leader, ":Lazy<CR>"),
    button("space q", "  Quit", leader, ":qa<CR>"),
}
dashboard.section.buttons.opts.hl = "String"

local function footer()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    return "   Have fun with Neovim" .. "  󱐋 Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
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

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
        dashboard.section.footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
    end,
})
