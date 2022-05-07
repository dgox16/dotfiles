call plug#begin()
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'sirver/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'
Plug 'akinsho/toggleterm.nvim'
Plug 'voldikss/vim-floaterm'
call plug#end()
