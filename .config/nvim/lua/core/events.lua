local vim = vim
local autocmd = {}

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
        if stats and stats.type == "directory" then
            vim.cmd("cd" .. vim.api.nvim_buf_get_name(0))
            vim.cmd("Alpha")
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        local old_laststatus = vim.opt.laststatus
        local prev_showtabline = vim.opt.showtabline
        vim.opt_local.winbar = nil
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = old_laststatus
                vim.opt.showtabline = prev_showtabline
            end,
        })
        vim.opt.showtabline = 0
        vim.opt.laststatus = 0
    end,
})

function autocmd.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command("augroup END")
    end
end

function autocmd.load_autocmds()
    local definitions = {
        ft = {
            { "FileType", "markdown", "set wrap" },
            { "FileType", "markdown", "nnoremap <leader>b :MarkdownPreview<CR>" },
            { "FileType", "tex", "set wrap" },
            { "FileType", "tex", "nnoremap <leader>b :TexlabForward<CR>" },
        },
        yank = {
            {
                "TextYankPost",
                "*",
                [[silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})]],
            },
        },
    }
    autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
