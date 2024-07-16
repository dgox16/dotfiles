alias g='lazygit'
alias df='df -h'     # human-readable sizes
alias free='free -h' # show sizes in MB
alias cs="clear"
alias mkdir="mkdir -pv"
alias v="nvim"
alias csn="cs && fastfetch"
alias ..="cd .."
alias ...="cd ../.."
alias lh="eza -l --color=always --icons --group-directories-first --octal-permissions --no-permissions"
alias lah="eza -al --color=always --icons --group-directories-first --octal-permissions --no-permissions"
alias ls="eza --color=always --icons --group-directories-first"
alias las="eza -a --color=always --icons --group-directories-first"
alias lt="eza -T --color=always --icons --group-directories-first"
alias lat="eza -aT --color=always --icons --group-directories-first"
alias du="dust -b"

alias glog='git log --graph --decorate --oneline'

# Django
alias djrun='python manage.py runserver'
alias djmkm='python manage.py makemigrations'
alias djmig='python manage.py migrate'

# Start services
alias spsql='sudo systemctl start postgresql.service'
alias sdocker='sudo systemctl start docker'
