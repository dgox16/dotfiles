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

local theme = {
    normal = {
        a = { fg = colors.mantle, bg = colors.blue },
        b = { fg = colors.blue, bg = colors.white },
        c = { fg = colors.white, bg = colors.mantle },
        z = { fg = colors.white, bg = colors.mantle },
    },
    insert = { a = { fg = colors.mantle, bg = colors.orange } },
    visual = { a = { fg = colors.mantle, bg = colors.green } },
    replace = { a = { fg = colors.mantle, bg = colors.green } },
}

local space = {
    function()
        return " "
    end,
    color = { bg = colors.mantle, fg = colors.blue },
}

local filename = {
    "filename",
    color = { bg = colors.blue, fg = "#242735" },
    separator = { left = "", right = "" },
}

local branch = {
    "branch",
    icon = "",
    color = { bg = "#a6e3a1", fg = "#313244" },
    separator = { left = "", right = "" },
}

local diff = {
    "diff",
    color = { bg = "#313244", fg = "#313244" },
    separator = { left = "", right = "" },
    symbols = { added = " ", modified = " ", removed = " " },

    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow },
        removed = { fg = colors.red },
    },
}

local modes = {
    "mode",
    fmt = function(str)
        return str:sub(1, 1)
    end,
    color = function()
        local mode_color = modecolor
        return { bg = mode_color[vim.fn.mode()], fg = colors.mantle }
    end,
    separator = { left = "", right = "" },
}

local function getLspName()
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
        return "  No servers"
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

    return "  " .. language_servers
end

local dia = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.orange },
        info = { fg = colors.sky },
        hint = { fg = colors.teal },
    },
    color = { bg = "#313244", fg = colors.blue },
    separator = { left = "", right = "" },
}

local lsp = {
    function()
        return getLspName()
    end,
    separator = { left = "", right = "" },
    color = { bg = "#f38ba8", fg = "#1e1e2e", gui = "italic" },
}

require("lualine").setup({

    options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
    },

    sections = {
        lualine_a = {
            modes,
        },
        lualine_b = {
            space,
        },
        lualine_c = {

            filename,
            space,
            branch,
            diff,
        },
        lualine_x = {
            space,
        },
        lualine_y = {},
        lualine_z = {
            dia,
            lsp,
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
})
