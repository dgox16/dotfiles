return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
    },
    config = function()
        local t = function(str)
            return vim.api.nvim_replace_termcodes(str, true, true, true)
        end

        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        vim.o.completeopt = "menu,menuone,noselect"

        local function border(hl_name)
            return {
                { "╭", hl_name },
                { "─", hl_name },
                { "╮", hl_name },
                { "│", hl_name },
                { "╯", hl_name },
                { "─", hl_name },
                { "╰", hl_name },
                { "│", hl_name },
            }
        end

        local cmp = require("cmp")

        local cmp_window = require("cmp.utils.window")

        cmp_window.info_ = cmp_window.info
        cmp_window.info = function(self)
            local info = self:info_()
            info.scrollable = false
            return info
        end

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = {
                    col_offset = -5,
                    side_padding = 0,
                    border = border("CmpBorder"),
                    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                },
                documentation = {
                    border = border("CmpBorder"),
                },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local kind = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                    })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. strings[1] .. " "
                    kind.menu = "     " .. strings[2]

                    return kind
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp", keyboard_length = 3 },
                { name = "luasnip", keyboard_length = 2 },
                { name = "buffer", keyboard_length = 3 },
                { name = "nvim_lua" },
                { name = "path" },
            }),
        })

        vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#585b70" })

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "cmp_git" },
            }, {
                { name = "buffer" },
            }),
        })
    end,
}
