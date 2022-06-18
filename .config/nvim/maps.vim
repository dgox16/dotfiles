let mapleader=" "
" redimensionar ventana
nnoremap <silent> <Leader>; $a;<Esc> 
nnoremap <silent> <C-Up> :resize -2<CR>
nnoremap <silent> <C-Down> :resize +2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" mejor tabulacion
vnoremap <silent> < <gv
vnoremap <silent> > >gv
" Diferentes opciones de guardado y cerrar
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q!<CR>
nnoremap <silent> <Leader>ex :wq!<CR>
" Manejo de buffers
nnoremap <silent> <M-d> :bw<CR>
nnoremap <silent> <M-h> :bp<CR>
nnoremap <silent> <M-l> :bn<CR>
nnoremap <silent> <leader>n :NvimTreeToggle<CR>
" LSP
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" FZF
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :Rg<CR>
" Moverte entre ventanas
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
" Ejecutar python 
nnoremap py :!python %<CR>
" Commentar linea 
nnoremap <silent> <Leader>/ :Commentary<CR>
vnoremap <silent> <Leader>/ :Commentary<CR>
" volver al modo normal
inoremap <silent> jk <esc>
" buscar y remplazar
nnoremap s :<C-u>s///g<Left><Left><Left>
nnoremap S :<C-u>%s///g<Left><Left><Left>
