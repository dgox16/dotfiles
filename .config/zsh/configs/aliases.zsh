alias g='lazygit'
alias df='df -h'     # human-readable sizes
alias free='free -h' # show sizes in MB
alias cs="clear"
alias v="nvim"
alias dnfu="sudo dnf update && sudo dnf upgrade"
alias csn="cs && fastfetch"
alias ..="cd .."
alias ...="cd ../.."
alias lh="eza -l --color=always --icons --group-directories-first --octal-permissions --no-permissions"
alias lah="eza -al --color=always --icons --group-directories-first --octal-permissions --no-permissions"
alias ls="eza --color=always --icons --group-directories-first"
alias las="eza -a --color=always --icons --group-directories-first"
alias lt="eza -aT --color=always --icons --group-directories-first"
alias f='cd && cd $(fd -I --type d --hidden --exclude .git --exclude toolchains --exclude node_modules --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude site-packages --exclude .cargo --exclude .var --exclude google-chrome --exclude mason --exclude packer | fzf)'
alias fv='cd && cd $(fd -I --type d --hidden --exclude .git --exclude toolchains --exclude node_modules --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude site-packages --exclude .cargo --exclude .var --exclude google-chrome --exclude mason --exclude packer| fzf) && v'

alias glog='git log --graph --decorate --oneline'

# Django
alias djrun='python manage.py runserver'
alias djmkm='python manage.py makemigrations'
alias djmig='python manage.py migrate'

