return {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm" },
    version = "v2.*",
    keys = {
        { "<M-q>", "<cmd>ToggleTerm<CR>", mode = "n" },
    },
    opts = {
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
    },
}
