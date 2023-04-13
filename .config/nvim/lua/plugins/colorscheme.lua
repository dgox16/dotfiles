return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
        config = function()
            local colors = require("catppuccin.palettes").get_palette()
            local ucolors = require("catppuccin.utils.colors")
            local telescope_prompt = ucolors.darken(colors.crust, 0.95, "#000000")
            local telescope_results = ucolors.darken(colors.mantle, 0.95, "#000000")
            local telescope_text = colors.text
            local telescope_prompt_title = colors.pink
            local telescope_preview_title = colors.teal

            require("catppuccin").setup({
                flavour = "mocha",
                styles = {
                    comments = { "italic" },
                    conditionals = { "bold" },
                    loops = { "bold" },
                    functions = { "italic", "bold" },
                    keywords = { "italic" },
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = { "bold", "italic" },
                    properties = { "italic" },
                    types = {},
                    operators = {},
                },
                integrations = {
                    treesitter = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                    lsp_trouble = true,
                    cmp = true,
                    gitsigns = true,
                    telescope = true,
                    hop = true,
                    mason = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = true,
                    },
                    markdown = true,
                    ts_rainbow2 = true,
                    noice = true,
                    neotree = true,
                    notify = true,
                    illuminate = true,
                    harpoon = true,
                },
                custom_highlights = function(C)
                    return {
                        PmenuSel = { bg = C.blue, fg = C.base },
                        Pmenu = { fg = C.text, bg = C.base },
                        CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
                        CmpItemKindKeyword = { fg = C.base, bg = C.red },
                        CmpItemKindText = { fg = C.base, bg = C.teal },
                        CmpItemKindMethod = { fg = C.base, bg = C.pink },
                        CmpItemKindConstructor = { fg = C.base, bg = C.pink },
                        CmpItemKindFunction = { fg = C.base, bg = C.pink },
                        CmpItemKindFolder = { fg = C.base, bg = C.pink },
                        CmpItemKindModule = { fg = C.base, bg = C.pink },
                        CmpItemKindConstant = { fg = C.base, bg = C.peach },
                        CmpItemKindField = { fg = C.base, bg = C.green },
                        CmpItemKindProperty = { fg = C.base, bg = C.green },
                        CmpItemKindEnum = { fg = C.base, bg = C.green },
                        CmpItemKindUnit = { fg = C.base, bg = C.green },
                        CmpItemKindClass = { fg = C.base, bg = C.yellow },
                        CmpItemKindVariable = { fg = C.base, bg = C.yellow },
                        CmpItemKindFile = { fg = C.base, bg = C.pink },
                        CmpItemKindInterface = { fg = C.base, bg = C.yellow },
                        CmpItemKindColor = { fg = C.base, bg = C.red },
                        CmpItemKindReference = { fg = C.base, bg = C.red },
                        CmpItemKindEnumMember = { fg = C.base, bg = C.red },
                        CmpItemKindStruct = { fg = C.base, bg = C.pink },
                        CmpItemKindValue = { fg = C.base, bg = C.peach },
                        CmpItemKindEvent = { fg = C.base, bg = C.pink },
                        CmpItemKindOperator = { fg = C.base, bg = C.pink },
                        CmpItemKindTypeParameter = { fg = C.base, bg = C.pink },
                        CmpItemKindCopilot = { fg = C.base, bg = C.teal },
                    }
                end,
                highlight_overrides = {
                    mocha = function(cp)
                        return {
                            IndentBlanklineContextChar = { fg = cp.surface2 },
                            HopNextKey = { fg = cp.yellow, style = { "bold" } },
                            HopNextKey1 = { fg = cp.blue, style = { "bold" } },
                            HopNextKey2 = { fg = cp.teal, style = { "bold", "italic" } },
                            HopUnmatched = { fg = cp.overlay0 },
                            Comment = { fg = colors.overlay1, style = { "italic" } },
                            TelescopeBorder = { bg = telescope_results, fg = telescope_results },
                            TelescopePromptBorder = { bg = telescope_prompt, fg = telescope_prompt },
                            TelescopePromptCounter = { fg = telescope_text },
                            TelescopePromptNormal = { fg = telescope_text, bg = telescope_prompt },
                            TelescopePromptPrefix = { fg = telescope_prompt_title, bg = telescope_prompt },
                            TelescopePromptTitle = { fg = telescope_prompt, bg = telescope_prompt_title },
                            TelescopePreviewTitle = { fg = telescope_results, bg = telescope_preview_title },
                            TelescopePreviewBorder = {
                                bg = ucolors.darken(telescope_results, 0.95, "#000000"),
                                fg = ucolors.darken(telescope_results, 0.95, "#000000"),
                            },
                            TelescopePreviewNormal = {
                                bg = ucolors.darken(telescope_results, 0.95, "#000000"),
                                fg = telescope_results,
                            },
                            TelescopeResultsTitle = { fg = telescope_results, bg = telescope_preview_title },
                            TelescopeMatching = { fg = telescope_prompt_title },
                            TelescopeNormal = { bg = telescope_results },
                            TelescopeSelection = { bg = telescope_prompt },
                            TelescopeSelectionCaret = { fg = telescope_text },
                            TelescopeResultsNormal = { bg = telescope_results },
                            TelescopeResultsBorder = { bg = telescope_results, fg = telescope_results },
                            -- For base configs.
                            CursorLineNr = { fg = cp.green },
                            LineNr = { fg = cp.overlay2 },
                            Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
                            IncSearch = { bg = cp.pink, fg = cp.surface1 },

                            CmpItemAbbr = { fg = cp.text },
                            CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
                        }
                    end,
                    latte = function(cp)
                        return {
                            HopNextKey = { fg = cp.red, style = { "bold" } },
                            HopNextKey1 = { fg = cp.blue, style = { "bold" } },
                            HopNextKey2 = { fg = cp.teal, style = { "bold", "italic" } },
                            HopUnmatched = { fg = cp.overlay0 },
                            Comment = { fg = colors.overlay1, style = { "italic" } },
                            -- For base configs.
                            CursorLineNr = { fg = cp.green },
                            LineNr = { fg = cp.overlay2 },
                            Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
                            IncSearch = { bg = cp.pink, fg = cp.surface1 },

                            CmpItemAbbr = { fg = cp.text },
                            CmpItemAbbrMatch = { fg = cp.lavender, style = { "bold" } },
                        }
                    end,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
