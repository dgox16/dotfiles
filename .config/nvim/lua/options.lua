vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.wrap = true
vim.opt.relativenumber = true
vim.opt.cursorline = true -- show the cursor line
vim.opt.mouse = "a" -- enable mouse
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.smartcase = true -- ignores case for search unless a capital is used in search
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.number = true
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.numberwidth = 5 -- wider gutter
vim.opt.linebreak = true -- don't break words on wrap
vim.opt.smartindent = true
vim.opt.completeopt = "menuone,noselect" -- nvim-cmp

-- timeout for whichkey
vim.opt.timeoutlen = 500

-- Vertically center document when entering insert mode
vim.cmd([[autocmd InsertEnter * norm zz]])
