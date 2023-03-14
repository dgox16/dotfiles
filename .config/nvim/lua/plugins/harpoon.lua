return {
    "ThePrimeagen/harpoon",
    keys = {
        { "<leader>ss" },
        { "<leader>sa" },
    },
    config = function()
        local terms = vim.g.harpoon_terms or 3
        local quick_binds = vim.g.harpoon_quick_binds or 5
        require("harpoon").setup()

        vim.keymap.set(
            "n",
            "<leader>ss",
            require("harpoon.ui").toggle_quick_menu,
            { noremap = true, silent = true, expr = false }
        )
        vim.keymap.set(
            "n",
            "<leader>sa",
            require("harpoon.mark").add_file,
            { noremap = true, silent = true, expr = false }
        )

        for i = 1, terms do
            vim.keymap.set("n", string.format("<leader><leader>%s", i), function()
                require("harpoon.term").gotoTerminal(1)
            end, { noremap = true, silent = true, expr = false })
        end

        for i = 1, quick_binds do
            vim.keymap.set("n", string.format("<leader>%s", i), function()
                require("harpoon.ui").nav_file(i)
            end, { noremap = true, silent = true, expr = false })
        end
    end,
}
