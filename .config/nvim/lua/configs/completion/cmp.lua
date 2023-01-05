local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(_, vim_item)
            local icons = require("configs.ui.icons").lspkind
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            return vim_item
        end,
    },
    experimental = {
        ghost_text = true,
    },
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    window = {
        completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-z>"] = cmp.mapping.complete(),
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
        { name = "nvim_lua" },
        { name = "luasnip", keyboard_length = 2 },
        { name = "buffer", keyboard_length = 3 },
        { name = "path" },
        { name = "dictionary", keyboard_length = 3 },
    }),
})

vim.api.nvim_set_hl(0, "BorderBG", { fg = "#89b4fa" })

cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" },
    }, {
        { name = "buffer" },
    }),
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
