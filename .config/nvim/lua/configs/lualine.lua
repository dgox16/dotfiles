local colors = require("catppuccin.palettes").get_palette()

local modecolor = {
    n = colors.pink,
    i = colors.teal,
    v = colors.mauve,
    [""] = colors.mauve,
    V = colors.red,
    c = colors.yellow,
    no = colors.red,
    s = colors.yellow,
    S = colors.yellow,
    [""] = colors.yellow,
    ic = colors.yellow,
    R = colors.green,
    Rv = colors.mauve,
    cv = colors.red,
    ce = colors.red,
    r = colors.teal,
    rm = colors.teal,
    ["r?"] = colors.teal,
    ["!"] = colors.red,
    t = colors.rosewater,
}

local theme = {
    normal = {
        a = { fg = colors.crust, bg = colors.blue },
        b = { fg = colors.blue, bg = colors.text },
        c = { fg = colors.text, bg = colors.crust },
        z = { fg = colors.text, bg = colors.crust },
    },
    insert = { a = { fg = colors.crust, bg = colors.peach } },
    visual = { a = { fg = colors.crust, bg = colors.green } },
    replace = { a = { fg = colors.crust, bg = colors.green } },
}

local space = {
    function()
        return " "
    end,
    color = { bg = colors.crust, fg = colors.blue },
}

local filename = {
    "filename",
    color = { bg = colors.blue, fg = colors.surface0, gui = "bold" },
    separator = { left = "", right = "" },
}

local filetype = {
    "filetype",
    icons_enabled = false,
    color = { bg = colors.surface0, fg = colors.blue, gui = "italic,bold" },
    separator = { left = "", right = "" },
}

local branch = {
    "branch",
    icon = "",
    color = { bg = colors.green, fg = colors.surface0, gui = "bold" },
    separator = { left = "", right = "" },
}

local location = {
    "location",
    color = { bg = colors.sky, fg = colors.surface0, gui = "bold" },
    separator = { left = "", right = "" },
}

local diff = {
    "diff",
    color = { bg = colors.surface0, fg = colors.surface0, gui = "bold" },
    separator = { left = "", right = "" },
    symbols = { added = " ", modified = " ", removed = " " },

    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow },
        removed = { fg = colors.red },
    },
}

local modes = {
    "mode",
    color = function()
        local mode_color = modecolor
        return { bg = mode_color[vim.fn.mode()], fg = colors.crust, gui = "bold" }
    end,
    separator = { right = "" },
}

local penguin = {
    function()
        return "󰻀"
    end,
    color = function()
        local mode_color = modecolor
        return { fg = mode_color[vim.fn.mode()], bg = colors.surface0 }
    end,
    separator = { right = "" },
}

local function getLspName()
    local buf_clients = vim.lsp.get_active_clients()
    local buf_ft = vim.bo.filetype
    if next(buf_clients) == nil then
        return "  No servers"
    end
    local buf_client_names = {}

    for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
        end
    end

    local lint_s, lint = pcall(require, "lint")
    if lint_s then
        for ft_k, ft_v in pairs(lint.linters_by_ft) do
            if type(ft_v) == "table" then
                for _, linter in ipairs(ft_v) do
                    if buf_ft == ft_k then
                        table.insert(buf_client_names, linter)
                    end
                end
            elseif type(ft_v) == "string" then
                if buf_ft == ft_k then
                    table.insert(buf_client_names, ft_v)
                end
            end
        end
    end

    local ok, conform = pcall(require, "conform")
    local formatters = table.concat(conform.list_formatters_for_buffer(), " ")
    if ok then
        for formatter in formatters:gmatch("%w+") do
            if formatter then
                table.insert(buf_client_names, formatter)
            end
        end
    end

    local hash = {}
    local unique_client_names = {}

    for _, v in ipairs(buf_client_names) do
        if not hash[v] then
            unique_client_names[#unique_client_names + 1] = v
            hash[v] = true
        end
    end
    local language_servers = table.concat(unique_client_names, ", ")

    return "  " .. language_servers
end

local macro = {
    require("noice").api.status.mode.get,
    cond = require("noice").api.status.mode.has,
    color = { fg = colors.red, bg = colors.crust, gui = "italic,bold" },
}

local dia = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.peach },
        info = { fg = colors.sky },
        hint = { fg = colors.teal },
    },
    color = { bg = colors.surface0, fg = colors.blue, gui = "bold" },
    separator = { left = "" },
}

local lsp = {
    function()
        return getLspName()
    end,
    separator = { left = "" },
    color = { bg = colors.mauve, fg = colors.surface0, gui = "italic,bold" },
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
            -- penguin,
            -- space,
            modes,
        },
        lualine_b = {
            space,
        },
        lualine_c = {
            filename,
            filetype,
            space,
            branch,
            diff,
            space,
            location,
        },
        lualine_x = {
            space,
        },
        lualine_y = { macro, space },
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
