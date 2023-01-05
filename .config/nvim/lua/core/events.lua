local vim = vim
local autocmd = {}

vim.cmd([[
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
       \ execute 'cd '.argv()[0] | execute 'NvimTree' | 
   ]])

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
    pattern = "NvimTree_*",
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if
            layout[1] == "leaf"
            and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
            and layout[3] == nil
        then
            vim.cmd("confirm quit")
        end
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
