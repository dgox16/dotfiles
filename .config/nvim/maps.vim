let mapleader=" "
nnoremap <Leader>; $a;<Esc>
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>s :wq!<CR>
nnoremap <Leader>d :bw<CR>
nnoremap <Leader>t :bn<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :Rg<CR>
nnoremap <silent> <Leader>k :call CocAction("doHover")<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap py :!python %<CR>
nnoremap <Leader>/ :Commentary<CR>
vnoremap <Leader>/ :Commentary<CR>
