so ~/.config/nvim/plugins.vim
so ~/.config/nvim/maps.vim
source ~/.config/nvim/config-plugins/cmp.lua
source ~/.config/nvim/config-plugins/floaterm.vim
source ~/.config/nvim/config-plugins/fzf.vim
source ~/.config/nvim/config-plugins/lsp.lua
source ~/.config/nvim/config-plugins/lualine.lua
source ~/.config/nvim/config-plugins/ntree.lua
source ~/.config/nvim/config-plugins/ntree.vim
source ~/.config/nvim/config-plugins/treesitter.lua
source ~/.config/nvim/config-plugins/vimtex.vim


let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
colorscheme catppuccin
syntax enable                           " Enables syntax highlighing
set completeopt=menu,menuone,noselect
set termguicolors
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set iskeyword+=-                      	"treat dash separated words as a word text object
set mouse=a                             " Enable your mouse
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set laststatus=2                        " Always display the status line
set expandtab                           " Converts tabs to spaces
set number relativenumber               " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=4                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
lua require'colorizer'.setup()
