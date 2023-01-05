local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    open_mapping = [[<M-q>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
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
