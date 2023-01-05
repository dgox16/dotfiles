[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source
plug "$HOME/.config/zsh/configs/aliases.zsh"
plug "$HOME/.config/zsh/configs/exports.zsh"
source ~/.config/zsh/configs/catppuccin.zsh

[ -f ~/.config/zsh/configs/functions.sh ] && source ~/.config/zsh/configs/functions.sh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

