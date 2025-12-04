#!/bin/bash
icons_dir="$HOME/.config/dunst/icons/"

get_volume() {
    volume=$(pamixer --get-volume)
    if [[ "$volume" -eq "0" ]]; then
        echo "Muted"
    else
        echo "$volume%"
    fi
}

get_icon() {
    current=$(get_volume)
    if [[ "$current" == "Muted" ]]; then
        echo "$icons_dir/volume-mute.svg"
    elif [[ "${current%\%}" -le 30 ]]; then
        echo "$icons_dir/volume-low.svg"
    elif [[ "${current%\%}" -le 60 ]]; then
        echo "$icons_dir/volume-medium.svg"
    else
        echo "$icons_dir/volume-high.svg"
    fi
}

notify_user() {
    if [[ "$(get_volume)" == "Muted" ]]; then
        notify-send -e -h string:x-canonical-private-synchronous:volume_notif -u low -i "$(get_icon)" "Volume: Muted"
    else
        notify-send -e -h int:value:"$(get_volume | sed 's/%//')" -h string:x-canonical-private-synchronous:volume_notif -u low -i "$(get_icon)" "Volume: $(get_volume)"
    fi
}

inc_volume() {
    if [ "$(pamixer --get-mute)" == "true" ]; then
        toggle_mute
    else
        pamixer -i 5 --allow-boost --set-limit 300 && notify_user
    fi
}

dec_volume() {
    if [ "$(pamixer --get-mute)" == "true" ]; then
        toggle_mute
    else
        pamixer -d 5 --allow-boost --set-limit 300 && notify_user
    fi
}

toggle_mute() {
    if [ "$(pamixer --get-mute)" == "false" ]; then
        pamixer -m && notify-send -e -u low -i "$icons_dir/volume-mute.svg" "Volume Switched OFF"
    elif [ "$(pamixer --get-mute)" == "true" ]; then
        pamixer -u && notify-send -e -u low -i "$(get_icon)" "Volume Switched ON"
    fi
}

if [[ "$1" == "--get" ]]; then
    get_volume
elif [[ "$1" == "--inc" ]]; then
    inc_volume
elif [[ "$1" == "--dec" ]]; then
    dec_volume
elif [[ "$1" == "--toggle" ]]; then
    toggle_mute
else
    get_volume
fi
