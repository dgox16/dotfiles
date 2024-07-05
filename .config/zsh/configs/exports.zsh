export EDITOR="nvim"
export SYSTEMD_EDITOR="nvim"
export TERMINAL="kitty"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export BAT_THEME="ansi"
export KITTY_SHELL_INTEGRATION="enabled"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
#export PATH="$PATH:./node_modules/.bin"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
