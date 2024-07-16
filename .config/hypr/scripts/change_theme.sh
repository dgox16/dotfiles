#!/bin/bash

linea_actual=$(grep 'palette = "' ~/.config/starship.toml)

if [[ $linea_actual == *"catppuccin"* ]]; then
    sed -i 's/@import "catppuccin.css"/@import "oldworld.css"/' ~/.config/waybar/style.css
    sed -i 's/palette = "catppuccin"/palette = "oldworld"/' ~/.config/starship.toml
    sed -i '4s|~/wallpapers/flowers.png|~/wallpapers/mountain-grey.png|' ~/.config/hypr/hyprpaper.conf
    sed -i 's|~/.config/rofi/catppuccin.rasi|~/.config/rofi/oldworld.rasi|' ~/.config/rofi/master_config.rasi
    kitty +kitten themes --reload-in=all oldworld
elif [[ $linea_actual == *"oldworld"* ]]; then
    sed -i 's/@import "oldworld.css"/@import "catppuccin.css"/' ~/.config/waybar/style.css
    sed -i 's/palette = "oldworld"/palette = "catppuccin"/' ~/.config/starship.toml
    sed -i '4s|~/wallpapers/mountain-grey.png|~/wallpapers/flowers.png|' ~/.config/hypr/hyprpaper.conf
    sed -i 's|~/.config/rofi/oldworld.rasi|~/.config/rofi/catppuccin.rasi|' ~/.config/rofi/master_config.rasi
    kitty +kitten themes --reload-in=all catppuccin
else
    echo "La línea no contiene ni 'catppuccin' ni 'oldworld'."
fi

. ~/.config/hypr/scripts/refresh.sh
