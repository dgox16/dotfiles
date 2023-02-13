#!/bin/sh
alias g='lazygit'
alias df='df -h'     # human-readable sizes
alias free='free -h' # show sizes in MB
alias psmem='ps auxf | sort -nr -k 4 | head -5'
alias pscpu='ps auxf | sort -nr -k 3 | head -5'
alias mdtex="pandoc --pdf-engine=xelatex -V geometry:'top=2cm, bottom=1.5cm, left=2cm, right=2cm' --highlight-style=zenburn -V fontsize=10pt -V colorlinks -V toccolor=NavyBlue "
alias cs="clear"
alias v="nvim"
alias cscd="cs && cd"
alias dnfu="sudo dnf update && sudo dnf upgrade"
alias macchina="macchina --theme fedoraCatppuccin"
alias csn="cs && macchina"
alias ..="cd .."
alias ...="cd ../.."
alias lh="exa -l --color=always --icons --group-directories-first --octal-permissions --no-permissions"
alias lah="exa -al --color=always --icons --group-directories-first --octal-permissions --no-permissions"
alias ls="exa --color=always --icons --group-directories-first"
alias las="exa -a --color=always --icons --group-directories-first"
alias lt="exa -aT --color=always --icons --group-directories-first"
alias texs="cp -r ~/Documentos/plantillasLatex/simple/* ./"
alias texr="cp -r ~/Documentos/plantillasLatex/reporte/* ./"
alias f='cd && cd $(fd -I --type d --hidden --exclude .git --exclude toolchains --exclude node_modules --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude site-packages --exclude .cargo --exclude .var --exclude google-chrome --exclude mason --exclude packer | fzf)'
alias fv='cd && cd $(fd -I --type d --hidden --exclude .git --exclude toolchains --exclude node_modules --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude site-packages --exclude .cargo --exclude .var --exclude google-chrome --exclude mason --exclude packer| fzf) && v'

alias glog='git log --graph --decorate --oneline'
