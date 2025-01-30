local autocmd = vim.api.nvim_create_autocmd

-- Keymaps para http
autocmd("FileType", {
    pattern = "http",
    callback = function()
        vim.keymap.set("n", "<leader>a", "<cmd>lua require('kulala').run()<CR>", { noremap = true, silent = true })
    end,
})
