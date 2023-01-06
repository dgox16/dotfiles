local lualine = require("lualine")

local colors = require("catppuccin.palettes").get_palette()

local modecolor = {
    n = colors.pink,
    i = colors.green,
    v = colors.mauve,
    [""] = colors.mauve,
    V = colors.blue,
    c = colors.yellow,
    no = colors.red,
    s = colors.yellow,
    S = colors.yellow,
    [""] = colors.yellow,
    ic = colors.yellow,
    R = colors.green,
    Rv = colors.violet,
    cv = colors.red,
    ce = colors.red,
    r = colors.teal,
    rm = colors.teal,
    ["r?"] = colors.teal,
    ["!"] = colors.red,
    t = colors.teal,
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,

    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        component_separators = "",
        section_separators = "",
        theme = {
            normal = { c = { fg = colors.text, bg = colors.mantle } },
            inactive = { c = { fg = colors.text, bg = colors.mantle } },
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left({
    "mode",
    separator = { left = "", right = "" },
    color = function()
        local mode_color = modecolor
        return { bg = mode_color[vim.fn.mode()], fg = colors.mantle }
    end,
})

ins_left({
    "filesize",
    padding = { left = 2 },
    cond = conditions.buffer_not_empty,
    color = { fg = colors.fg, gui = "bold" },
})

ins_left({
    "location",
    color = { fg = colors.blue, gui = "bold" },
})

ins_left({ "progress", color = { fg = colors.yellow, gui = "bold" } })

ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    diagnostics_color = {
        color_error = { fg = colors.pink },
        color_warn = { fg = colors.orange },
        color_info = { fg = colors.sky },
        hint = { fg = colors.teal },
    },
})

ins_left({
    function()
        return "%="
    end,
})

ins_left({
    function(msg)
        local buf_clients = vim.lsp.buf_get_clients()
        if next(buf_clients) == nil then
            if type(msg) == "boolean" or #msg == 0 then
                return "Inactive"
            end
            return msg
        end
        local buf_client_names = {}

        for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" then
                table.insert(buf_client_names, client.name)
            end
        end

        local null_ls = require("null-ls")
        local buf_ft = vim.bo.filetype
        local s = require("null-ls.sources")
        local method = null_ls.methods.FORMATTING
        local alternative_methods = {
            null_ls.methods.DIAGNOSTICS,
            null_ls.methods.DIAGNOSTICS_ON_OPEN,
            null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }

        local available_sources = s.get_available(buf_ft)
        local registered = {}
        for _, source in ipairs(available_sources) do
            for method in pairs(source.methods) do
                registered[method] = registered[method] or {}
                table.insert(registered[method], source.name)
            end
        end

        local formatters = registered[method] or {}

        local linters = vim.tbl_flatten(vim.tbl_map(function(m)
            return registered[m] or {}
        end, alternative_methods))

        vim.list_extend(buf_client_names, linters)
        vim.list_extend(buf_client_names, formatters)

        local unique_client_names = vim.fn.uniq(buf_client_names)

        local language_servers = table.concat(unique_client_names, ", ")

        return language_servers
    end,

    icon = "  LSP:",
    color = { fg = colors.lavender, gui = "italic" },
})

ins_right({
    "filetype",
    fmt = string.upper,
    icons_enabled = false,
    cond = conditions.hide_in_width,
    color = { fg = colors.sky, gui = "bold" },
})

ins_right({
    "fileformat",
    fmt = string.upper,
    icons_enabled = false,
    color = { fg = colors.green, gui = "bold" },
})

ins_right({
    "branch",
    icon = "",
    color = { fg = colors.pink, gui = "bold" },
})

ins_right({
    "diff",
    symbols = { added = " ", modified = " ", removed = " " },

    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
})

lualine.setup(config)
