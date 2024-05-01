local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- NORMAL MODE
vim.api.nvim_set_keymap("n", "ZZ", "<Nop>", opts)
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
--Actualizar Plugins
keymap("n", "<Leader>l", ":Lazy<CR>", opts)
-- Buscar y remplazar
keymap("n", "<Leader>r", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>", { noremap = true, silent = false })
-- Abrir ajustes nvim
-- keymap("n", "<Leader>n", ":e $MYVIMRC | :cd %:p:h <CR>", opts)
-- Scroll mas rapido
keymap("n", "<C-e>", "2<C-e>", opts)
keymap("n", "<C-y>", "2<C-y>", opts)
-- Mover lineas arriba o abajo
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
-- Moverse de forma normal en lineas largas con wrap
keymap("n", "k", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
keymap("n", "j", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
keymap("n", "<Down>", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
keymap("n", "<Up>", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
-- Remover highlights
keymap("n", "<esc>", "<cmd>noh<cr><esc>", opts)
keymap("n", "<Leader>bb", "<cmd>e #<cr>", opts)

-- MODO INSERTAR
-- Eliminar la palabra de adelante
keymap("i", "<C-d>", "<C-O>dw", opts)
-- Eliminar el resto de linea
keymap("i", "<C-D>", "<C-o>D", opts)
-- Mover lineas arriba o abajo
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- Mover al inicio de linea
keymap("i", "<C-b>", "<Esc>^i", opts)
-- Mover al final de la linea
keymap("i", "<C-e>", "<End>", opts)

keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)

-- MODO VISUAL
-- Mejor indentacion
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Mover lineas arriba o abajo
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
-- J y K solo para moverse
keymap("x", "J", "j", opts)
keymap("x", "K", "k", opts)
-- Moverse de forma normal en lineas largas con wrap
keymap("v", "j", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
keymap("v", "k", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
keymap("v", "<Down>", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
keymap("v", "<Up>", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
