# .bashrc
export BAT_THEME="Catppuccin"
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
export TERM="xterm-256color"

#alias
alias dnfu="sudo dnf update"
alias v="nvim"
alias cs="clear"
alias cscd="cs && cd"
alias csn="cs && neofetch"
alias lh="exa -l --color=always --group-directories-first --octal-permissions --no-permissions --no-user --icons"
alias lah="exa -al --color=always --group-directories-first --octal-permissions --no-permissions --icons"
alias ls="exa --color=always --group-directories-first"
alias las="exa -a --color=always --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first --icons"
alias ..="cd .."
alias ...="cd ../.."
alias glog='git log --graph --decorate --oneline' 
alias bye="shutdown now"
alias matlab='$MATLAB_ROOT_DIR/bin/matlab &> /dev/null &'
alias blueon='sudo systemctl start bluetooth.service'
alias colorpacman='colorscript -e 33'
alias coloradn='colorscript -e 21'
alias matrix='cmatrix'
alias packetdir='cd /home/dgox16/.var/app/com.cisco.PacketTracer/pt/saves && lh'
# alias bat='bat --theme=base16-256'
alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME

export MATLAB_ROOT_DIR="/home/dgox16/Matlab/R2021a"

eval "$(starship init bash)"

. "$HOME/.cargo/env"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias luamake=/home/dgox16/lua-language-server/3rd/luamake/luamake
