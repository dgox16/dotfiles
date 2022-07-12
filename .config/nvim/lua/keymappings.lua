local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MODE
-- Redimensionar
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Moverse entre ventanas
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Diferentes formas de guardar y salir
keymap("n", "<Leader>w", ":w<CR>", opts)
keymap("n", "<Leader>q", ":q<CR>", opts)
-- Abrir explorador de archivos
keymap("n", "<Leader>n", ":NvimTreeToggle<CR>", opts)
-- Manejo de Buffers
keymap("n", "<M-d>", ":bw<CR>", opts)
keymap("n", "<M-h>", ":bp<CR>", opts)
keymap("n", "<M-l>", ":bn<CR>", opts)
-- LSP
keymap("n", "K", "vim.lsp.buf.hover", opts)
keymap("n", "gd", "vim.lsp.buf.definition", opts)
keymap("n", "gD", "vim.lsp.buf.declaration", opts)
keymap("n", "gi", "vim.lsp.buf.implementation", opts)
keymap("n", "gr", "vim.lsp.buf.references", opts)
-- FZF
keymap("n", "<Leader>f", "<cmd>lua require('fzf-lua').files()<CR>", opts)
keymap("n", "<Leader>g", "<cmd>lua require('fzf-lua').grep()<CR>", opts)
keymap("n", "<Leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", opts)
-- Comentar linea
keymap("n", "<Leader>/", ":Commentary<CR>", opts)
-- Buscar y remplazar
keymap("n", "<C-s>", ":<C-u>%s///g<Left><Left><Left>", opts)
-- Ejecutar Python
keymap("n", "py", ":!python %<CR>", opts)
-- Formatear
keymap("n", "<Leader>o", ":Format<CR>", opts)

-- MODO INSERTAR
keymap("i", "jk", "<ESC>", opts)

-- MODO VISUAL
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<Leader>/", ":Commentary<CR>", opts)
