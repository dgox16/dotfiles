#!/bin/sh
export EDITOR="nvim"
export TERMINAL="kitty"
# export BROWSER="brave"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export BAT_THEME="Catppuccin-mocha"
#export PATH="$PATH:./node_modules/.bin"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

