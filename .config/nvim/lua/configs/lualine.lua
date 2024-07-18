local function config_lualine(colors)
    local modecolor = {
        n = colors.red,
        i = colors.cyan,
        v = colors.purple,
        [""] = colors.purple,
        V = colors.red,
        c = colors.yellow,
        no = colors.red,
        s = colors.yellow,
        S = colors.yellow,
        [""] = colors.yellow,
        ic = colors.yellow,
        R = colors.green,
        Rv = colors.purple,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.bright_red,
    }

    local theme = {
        normal = {
            a = { fg = colors.bg_dark, bg = colors.blue },
            b = { fg = colors.blue, bg = colors.white },
            c = { fg = colors.white, bg = colors.bg_dark },
            z = { fg = colors.white, bg = colors.bg_dark },
        },
        insert = { a = { fg = colors.bg_dark, bg = colors.orange } },
        visual = { a = { fg = colors.bg_dark, bg = colors.green } },
        replace = { a = { fg = colors.bg_dark, bg = colors.green } },
    }

    local space = {
        function()
            return " "
        end,
        color = { bg = colors.bg_dark, fg = colors.blue },
    }

    local filename = {
        "filename",
        color = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        separator = { left = "", right = "" },
    }

    local filetype = {
        "filetype",
        icons_enabled = false,
        color = { bg = colors.gray2, fg = colors.blue, gui = "italic,bold" },
        separator = { left = "", right = "" },
    }

    local branch = {
        "branch",
        icon = "",
        color = { bg = colors.green, fg = colors.bg, gui = "bold" },
        separator = { left = "", right = "" },
    }

    local location = {
        "location",
        color = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        separator = { left = "", right = "" },
    }

    local diff = {
        "diff",
        color = { bg = colors.gray2, fg = colors.bg, gui = "bold" },
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
            return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark, gui = "bold" }
        end,
        separator = { left = "", right = "" },
    }

    local function getLspName()
        local bufnr = vim.api.nvim_get_current_buf()
        local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })
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
        color = { fg = colors.red, bg = colors.bg_dark, gui = "italic,bold" },
    }

    local dia = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        diagnostics_color = {
            error = { fg = colors.red },
            warn = { fg = colors.yellow },
            info = { fg = colors.purple },
            hint = { fg = colors.cyan },
        },
        color = { bg = colors.gray2, fg = colors.blue, gui = "bold" },
        separator = { left = "" },
    }

    local lsp = {
        function()
            return getLspName()
        end,
        separator = { left = "", right = "" },
        color = { bg = colors.purple, fg = colors.bg, gui = "italic,bold" },
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
end

if vim.g.colors_name == "oldworld" then
    local colors = require("oldworld.palette")
    config_lualine(colors)
elseif vim.g.colors_name == "catppuccin-mocha" then
    local palette = require("catppuccin.palettes").get_palette("mocha")
    local colors = {
        bg = palette.base,
        fg = palette.text,
        subtext1 = palette.subtext1,
        subtext2 = palette.subtext0,
        subtext3 = palette.overlay2,
        subtext4 = palette.overlay1,
        bg_dark = palette.mantle,
        black = palette.crustr,
        red = palette.red,
        green = palette.green,
        yellow = palette.yellow,
        purple = palette.mauve,
        magenta = palette.pink,
        orange = palette.peach,
        blue = palette.blue,
        cyan = palette.teal,
        gray0 = palette.surface2,
        gray1 = palette.surface1,
        gray2 = palette.surface0,
        gray3 = palette.surface0,
        gray4 = palette.surface0,
    }
    config_lualine(colors)
elseif vim.g.colors_name == "everforest" then
    local everforest = require("everforest")
    local colours = require("everforest.colours")

    -- Instead of `everforest.config`, you can add in your own config here by using
    -- `everforest.setup({ show_eob = false)` before you generate the palette.
    local palette = colours.generate_palette(everforest.config, vim.o.background)
    local colors = {
        bg = palette.bg0,
        fg = palette.fg,
        subtext1 = palette.fg,
        subtext2 = palette.fg,
        subtext3 = palette.fg,
        subtext4 = palette.fg,
        bg_dark = palette.bg_dim,
        black = palette.bg0,
        red = palette.red,
        green = palette.green,
        yellow = palette.yellow,
        purple = palette.purple,
        magenta = palette.purple,
        orange = palette.orange,
        blue = palette.blue,
        cyan = palette.aqua,
        gray0 = palette.statusline1,
        gray1 = palette.statusline1,
        gray2 = palette.statusline0,
        gray3 = palette.statusline0,
        gray4 = palette.statusline0,
    }
    config_lualine(colors)
end
