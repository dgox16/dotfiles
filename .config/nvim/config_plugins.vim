colorscheme catppuccin
lua << EOF
local catppuccin = require("catppuccin")
catppuccin.setup(
    {
		transparent_background = true,
        term_colors = false,
}
)
vim.cmd[[colorscheme catppuccin]]
EOF
let g:lightline = {'colorscheme': 'catppuccin'}
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --theme=base16-256 --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:floaterm_keymap_toggle = '<C-t>'
let g:floaterm_width=0.7
let g:floaterm_height=0.7
let g:floaterm_title=0
