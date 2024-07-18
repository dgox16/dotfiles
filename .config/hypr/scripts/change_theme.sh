#!/bin/bash

linea_actual=$(grep 'palette = "' ~/.config/starship.toml)

if [[ $linea_actual == *"catppuccin"* ]]; then
    sed -i 's/@import "catppuccin.css"/@import "oldworld.css"/' ~/.config/waybar/style.css
    sed -i 's/palette = "catppuccin"/palette = "oldworld"/' ~/.config/starship.toml
    sed -i 's|~/wallpapers/flowers.png|~/wallpapers/mountain-grey.png|' ~/.config/hypr/hyprpaper.conf
    sed -i 's|~/.config/rofi/catppuccin.rasi|~/.config/rofi/oldworld.rasi|' ~/.config/rofi/master_config.rasi
    sed -i 's/vim.cmd.colorscheme("catppuccin")/vim.cmd.colorscheme("oldworld")/' ~/.config/nvim/lua/core/init.lua
    kitty +kitten themes --reload-in=all oldworld
elif [[ $linea_actual == *"oldworld"* ]]; then
    sed -i 's/@import "oldworld.css"/@import "everforest.css"/' ~/.config/waybar/style.css
    sed -i 's/palette = "oldworld"/palette = "everforest"/' ~/.config/starship.toml
    sed -i 's|~/wallpapers/mountain-grey.png|~/wallpapers/everforest.jpg|' ~/.config/hypr/hyprpaper.conf
    sed -i 's/vim.cmd.colorscheme("oldworld")/vim.cmd.colorscheme("everforest")/' ~/.config/nvim/lua/core/init.lua
    kitty +kitten themes --reload-in=all everforest
elif [[ $linea_actual == *"everforest"* ]]; then
    sed -i 's/@import "everforest.css"/@import "catppuccin.css"/' ~/.config/waybar/style.css
    sed -i 's/palette = "everforest"/palette = "catppuccin"/' ~/.config/starship.toml
    sed -i 's|~/wallpapers/everforest.jpg|~/wallpapers/flowers.png|' ~/.config/hypr/hyprpaper.conf
    sed -i 's|~/.config/rofi/everforest.rasi|~/.config/rofi/catppuccin.rasi|' ~/.config/rofi/master_config.rasi
    sed -i 's/vim.cmd.colorscheme("everforest")/vim.cmd.colorscheme("catppuccin")/' ~/.config/nvim/lua/core/init.lua
    kitty +kitten themes --reload-in=all catppuccin
else
    echo "La línea no contiene ni 'catppuccin', 'oldworld', ni 'everforest'."
fi

. ~/.config/hypr/scripts/refresh.sh
