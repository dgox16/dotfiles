#!/bin/bash

icons_dir="$HOME/.config/dunst/icons/"

# Get brightness
get_backlight() {
    echo $(brightnessctl -m | cut -d, -f4)
}

# Get icons
get_icon() {
    current=$(get_backlight | sed 's/%//')
    if [ "$current" -le "50" ]; then
        icon="$icons_dir/brightness-low.svg"
    else
        icon="$icons_dir/brightness-high.svg"
    fi
}

# Notify
notify_user() {
    notify-send -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:$current -u low -i "$icon" "Brightness: $current%"
}

# Change brightness
change_backlight() {
    brightnessctl set "$1" -n && get_icon && notify_user
}

# Execute accordingly
case "$1" in
"--get")
    get_backlight
    ;;
"--inc")
    change_backlight "+10%"
    ;;
"--dec")
    change_backlight "10%-"
    ;;
*)
    get_backlight
    ;;
esac
