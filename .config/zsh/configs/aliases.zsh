#!/bin/sh
alias g='lazygit'
alias df='df -h'     # human-readable sizes
alias free='free -h' # show sizes in MB
alias psmem='ps auxf | sort -nr -k 4 | head -5'
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

alias v="nvim"
alias cs="clear"
alias cscd="cs && cd"
alias dnfu="sudo dnf update && sudo dnf upgrade"
alias csn="cs && neofetch"
alias ..="cd .."
alias ...="cd ../.."
alias lh="exa -l --color=always --group-directories-first --octal-permissions --no-permissions --no-user"
alias lah="exa -al --color=always --group-directories-first --octal-permissions --no-permissions"
alias ls="exa --color=always --group-directories-first"
alias las="exa -a --color=always --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"
alias texs="cp -r ~/Documents/plantillasLatex/simple/* ./"
alias texr="cp -r ~/Documents/plantillasLatex/reporte/* ./"
alias f='cd && cd $(fd -I --type d --hidden --exclude .git --exclude toolchains --exclude node_modules --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude site-packages --exclude .cargo --exclude .var --exclude google-chrome --exclude mason --exclude packer | fzf)'
alias fv='cd && cd $(fd -I --type d --hidden --exclude .git --exclude toolchains --exclude node_modules --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude site-packages --exclude .cargo --exclude .var --exclude google-chrome --exclude mason --exclude packer| fzf) && v'

alias glog='git log --graph --decorate --oneline'

