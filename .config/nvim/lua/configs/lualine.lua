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
        local buf_ft = vim.bo.filetype

        local client_names = {}

        ----------------------------------------------------------------------
        -- LSP clients
        ----------------------------------------------------------------------
        local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })

        for _, client in ipairs(buf_clients) do
            table.insert(client_names, client.name)
        end

        ----------------------------------------------------------------------
        -- nvim-lint
        ----------------------------------------------------------------------
        local lint_ok, lint = pcall(require, "lint")
        if lint_ok and lint.linters_by_ft then
            local linters = lint.linters_by_ft[buf_ft]
            if type(linters) == "table" then
                for _, l in ipairs(linters) do
                    table.insert(client_names, l)
                end
            elseif type(linters) == "string" then
                table.insert(client_names, linters)
            end
        end

        ----------------------------------------------------------------------
        -- conform.nvim
        ----------------------------------------------------------------------
        local conform_ok, conform = pcall(require, "conform")
        if conform_ok then
            local formatters = table.concat(conform.list_formatters_for_buffer(), " ")
            if conform_ok then
                for formatter in formatters:gmatch("%w+") do
                    if formatter then
                        table.insert(client_names, formatter)
                    end
                end
            end
        end

        ----------------------------------------------------------------------
        -- Si no hay nada, mostrar "No tools"
        ----------------------------------------------------------------------
        if #client_names == 0 then
            return "  No tools"
        end

        ----------------------------------------------------------------------
        -- Eliminar duplicados
        ----------------------------------------------------------------------
        local uniq, seen = {}, {}
        for _, name in ipairs(client_names) do
            if not seen[name] then
                table.insert(uniq, name)
                seen[name] = true
            end
        end

        return "  " .. table.concat(uniq, ", ")
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
            disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
            icons_enabled = true,
            theme = theme,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
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

local colors = require("oldworld.palette")
config_lualine(colors)
vim.o.laststatus = vim.g.lualine_laststatus
