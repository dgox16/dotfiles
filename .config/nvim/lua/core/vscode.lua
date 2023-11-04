local disable_providers = function()
    local default_providers = {
        "node",
        "perl",
        "python3",
        "ruby",
    }

    for _, provider in ipairs(default_providers) do
        vim.g["loaded_" .. provider .. "_provider"] = 0
    end
end

local leader_map = function()
    vim.api.nvim_set_keymap("n", "<Space>", "", { noremap = true })
    vim.api.nvim_set_keymap("x", "<Space>", "", { noremap = true })
    vim.g.maplocalleader = " "
    vim.g.mapleader = " "
end

local clipboard_config = function()
    vim.g.clipboard = {
        name = "xsel",
        copy = {
            ["+"] = "xsel --nodetach -i -b",
            ["*"] = "xsel --nodetach -i -p",
        },
        paste = {
            ["+"] = "xsel -o -b",
            ["*"] = "xsel -o -p",
        },
        cache_enabled = 1,
    }
end

local keymapping = function()
    local opts = { noremap = true, silent = true }

    local keymap = vim.keymap.set

    -- Diferentes formas de guardar y salir
    -- Moverse de forma normal en lineas largas con wrap
    keymap("n", "k", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
    keymap("n", "j", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
    keymap("n", "<Down>", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
    keymap("n", "<Up>", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
    -- MODO VISUAL
    -- Mejor indentacion
    keymap("v", "<", "<gv", opts)
    keymap("v", ">", ">gv", opts)
    -- Moverse de forma normal en lineas largas con wrap
    keymap("v", "j", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
    keymap("v", "k", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
    keymap("v", "<Down>", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
    keymap("v", "<Up>", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
    vim.cmd([[
        xmap gc  <Plug>VSCodeCommentary
        nmap gc  <Plug>VSCodeCommentary
        omap gc  <Plug>VSCodeCommentary
        nmap gcc <Plug>VSCodeCommentaryLine
        nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
        xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
        nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
        xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
        nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
        xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
        nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
        xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
    ]])
end

local plugins = function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
        {
            "kylechui/nvim-surround",
            version = "*",
            keys = { "cs", "ys", "ds" },
            config = true,
        },
        {
            "phaazon/hop.nvim",
            cmd = "HopWord",
            keys = { { "ñ", "<cmd>HopWord<cr>" } },
            opts = {
                keys = "etovxqpdygfblzhckisuran",
            },
        },
        {
            "nvim-lua/plenary.nvim",
            event = "VeryLazy",
        },
    })
end

local colors = function()
    vim.api.nvim_set_hl(0, "HopUnmatched", { fg = "#6c7086" })
    vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#f9e2af", bold = true })
    vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#89b4fa", bold = true })
    vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#94e2d5", bold = true, italic = true })
end

local autocmds = function()
    local autocmd = vim.api.nvim_create_autocmd

    autocmd("TextYankPost", {
        callback = function()
            vim.highlight.on_yank()
        end,
    })
end

local load_core = function()
    disable_providers()
    leader_map()
    clipboard_config()
    keymapping()
    plugins()
    colors()
    autocmds()

    require("core.options")
end

load_core()
