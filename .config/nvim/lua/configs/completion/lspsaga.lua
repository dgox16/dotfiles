local lspsaga = require("lspsaga")
require("lspsaga").init_lsp_saga({
    symbol_in_winbar = {
        enable = false,
        in_custom = false,
        show_file = false,
        file_formatter = "",
        click_support = function(node, clicks, button, modifiers)
            local st = node.range.start
            local en = node.range["end"]
            if button == "l" then
                if clicks == 2 then
                else -- jump to node's starting line+char
                    vim.fn.cursor(st.line + 1, st.character + 1)
                end
            elseif button == "r" then
                if modifiers == "s" then
                    print("lspsaga") -- shift right click to print "lspsaga"
                end -- jump to node's ending line+char
                vim.fn.cursor(en.line + 1, en.character + 1)
            elseif button == "m" then
                -- middle click to visual select node
                vim.fn.cursor(st.line + 1, st.character + 1)
                vim.api.nvim_command([[normal v]])
                vim.fn.cursor(en.line + 1, en.character + 1)
            end
        end,
    },
})
