[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
DISABLE_AUTO_TITLE="true"

# source
plug "$HOME/.config/zsh/configs/aliases.zsh"
plug "$HOME/.config/zsh/configs/exports.zsh"
plug "$HOME/.config/zsh/configs/colors.zsh"


HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
precmd () {print -Pn "\e]0;%~\a"}

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "softmoth/zsh-vim-mode"

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
