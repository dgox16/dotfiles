local autocmd = vim.api.nvim_create_autocmd

-- Keymaps para el rest client
autocmd("FileType", {
    pattern = "http",
    callback = function()
        vim.o.wrap = true
        local buff = tonumber(vim.fn.expand("<abuf>"), 10)
        vim.keymap.set("n", "<leader>rn", require("rest-nvim").run, { noremap = true, buffer = buff })
        vim.keymap.set("n", "<leader>rl", require("rest-nvim").last, { noremap = true, buffer = buff })
        vim.keymap.set("n", "<leader>rp", function()
            require("rest-nvim").run(true)
        end, { noremap = true, buffer = buff })
    end,
})

-- Keymaps para usar javascriptreact
autocmd("FileType", {
    pattern = "javascript",
    callback = function()
        vim.keymap.set("n", "<leader>h", ":setfiletype javascriptreact<cr>", { noremap = true, silent = true })
    end,
})

-- Keymaps para usar htmldjango
autocmd("FileType", {
    pattern = "html",
    callback = function()
        vim.keymap.set("n", "<leader>h", ":setfiletype htmldjango<cr>", { noremap = true, silent = true })
    end,
})

-- Cambiar directorio en caso de abrir con argumentos
autocmd("BufEnter", {
    callback = function()
        local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
        if stats and stats.type == "directory" then
            vim.cmd("cd" .. vim.api.nvim_buf_get_name(0))
            vim.cmd("Alpha")
            vim.cmd("bd#")
        end
    end,
})

-- No mostrar statusline, statuscolumn ni bufferline en pantalla de inicio
autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        local old_laststatus = vim.opt.laststatus
        local prev_showtabline = vim.opt.showtabline
        local prev_statuscolumn = vim.opt.statuscolumn
        vim.opt_local.winbar = nil
        autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = old_laststatus
                vim.opt.showtabline = prev_showtabline
                vim.opt.statuscolumn = prev_statuscolumn
            end,
        })
        vim.opt.showtabline = 0
        vim.opt.laststatus = 0
        vim.o.statuscolumn = ""
    end,
})

-- Ocultar statuscolumn en el gestor de archivos
autocmd({ "BufWinEnter", "BufAdd" }, {
    callback = function(opts)
        if vim.bo[opts.buf].filetype == "toggleterm" then
            vim.o.statuscolumn = ""
        end
    end,
})

-- Wrap en algunos tipos de archivos
autocmd("FileType", {
    pattern = { "tex", "markdown" },
    callback = function()
        vim.o.wrap = true
    end,
})

-- Keymaps para markdown
autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.keymap.set("n", "<leader>b", ":MarkdownPreview<CR>", { noremap = true, silent = true })
    end,
})

-- Keymaps para tex
autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.keymap.set("n", "<leader>b", ":TexlabForward<CR>", { noremap = true, silent = true })
    end,
})
