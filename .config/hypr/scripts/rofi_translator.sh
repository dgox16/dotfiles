rofi_config="$HOME/.config/rofi/config_translator.rasi"

# Matar rofi si ya está abierto
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
    exit 0
fi

# Selección de dirección
direction=$(printf "Español → Inglés\nInglés → Español" | rofi -i -dmenu -p "Selecciona idioma" -config "$rofi_config")

# Cancelado
[ $? -ne 0 ] && exit

# Determinar idioma de destino
case "$direction" in
"Español → Inglés")
    from_lang="es"
    to_lang="en"
    ;;
"Inglés → Español")
    from_lang="en"
    to_lang="es"
    ;;
*)
    exit
    ;;
esac

# Variables iniciales
input=""
translation=""

while true; do
    input=$(rofi -i -dmenu -p "Traducir [$from_lang->$to_lang]" -config "$rofi_config" -mesg "$translation")

    # Cancelado
    [ $? -ne 0 ] && exit

    if [ -n "$input" ]; then
        translation=$(trans -b :"$to_lang" -s "$from_lang" "$input")
        echo "$translation" | wl-copy
    fi
done
