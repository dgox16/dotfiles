#-----------------------------
# Quick lookup (and edit)
#-----------------------------
function check_req() {
    $(type bat >/dev/null 2>&1) && $(type fd >/dev/null 2>&1) && $(type fzf >/dev/null 2>&1)
}

function pbv() {
    if $(check_req); then

        local selected_file=$(
            fd --type f \
                --hidden \
                --follow \
                --exclude .git |
                fzf --height 80% \
                    --layout reverse \
                    --info inline \
                    --border \
                    --preview "bat --style=numbers --color=always {} | head -500" \
                    --preview-window "down:24:noborder" \
                    --color=dark \
                    --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f \
                    --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7 \
                    --prompt="File > " \
                    --query "$LBUFFER"
        )

        if [ -n "$selected_file" ]; then
            BUFFER="v $selected_file"
            zle accept-line
        fi
        zle reset-prompt

    fi
}

function psv() {
    if $(check_req); then

        local selected_file=$(
            fd --type f \
                --hidden \
                --follow \
                --exclude .git |
                fzf --preview "bat --style=numbers --color=always {} | head -500" \
                    --color=dark \
                    --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f \
                    --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
        )

        if [ -n "$selected_file" ]; then
            BUFFER="v $selected_file"
            zle accept-line
        fi
        zle reset-prompt

    fi
}

zle -N psv
zle -N pbv
bindkey '^P' psv
bindkey '^O' pbv
