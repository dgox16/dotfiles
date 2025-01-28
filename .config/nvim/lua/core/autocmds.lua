local autocmd = vim.api.nvim_create_autocmd

-- Keymaps para markdown
autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.keymap.set("n", "<leader>b", ":MarkdownPreview<CR>", { noremap = true, silent = true })
    end,
})
