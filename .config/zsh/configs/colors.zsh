# Catppuccin Mocha Theme (for zsh-syntax-highlighting)
#
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#57575f'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#90b99f,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#90b99f'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#90b99f'
ZSH_HIGHLIGHT_STYLES[function]='fg=#90b99f'
ZSH_HIGHLIGHT_STYLES[command]='fg=#90b99f,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#90b99f,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#aca1cf,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#aca1cf'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#aca1cf'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#aca1cf'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#57575f'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#90b99f'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#90b99f'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#90b99f'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#92a2d5'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#92a2d5'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#92a2d5'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#92a2d5'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#f9e2af'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#c9c7cd'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[path]='fg=#c9c7cd,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#92a2d5,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#c9c7cd,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#92a2d5,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#aca1cf'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[default]='fg=#c9c7cd'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#c9c7cd'
