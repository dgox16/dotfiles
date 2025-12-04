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


# Atajos básicos de docker
alias d="docker"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias di="docker images"
alias db="docker build"
alias dex="docker exec -it"
alias drm="docker rm"
alias drmi="docker rmi"
alias dst="docker stop"
alias drs="docker restart"

alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcl="docker compose logs -f"
alias dcb="docker compose build"
alias dce="docker compose exec"

alias dv="docker compose -f docker-compose.dev.yml"
alias dvu="docker compose -f docker-compose.dev.yml up -d"
alias dvd="docker compose -f docker-compose.dev.yml down"
alias dvl="docker compose -f docker-compose.dev.yml logs -f"
alias dvb="docker compose -f docker-compose.dev.yml build"
alias dve="docker compose -f docker-compose.dev.yml exec"
