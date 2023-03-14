return {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm" },
    version = "v2.*",
    keys = {
        { "<M-q>", "<cmd>ToggleTerm<CR>", mode = "n" },
        { "<leader>gg" },
    },
    config = function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
        })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
        require("toggleterm").setup({
            open_mapping = [[<M-q>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = false,
            shading_factor = "1",
            direction = "horizontal",
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.40
                end
            end,
        })
    end,
}
