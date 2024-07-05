# Define file_exists function
file_exists() {
	if [ -e "$1" ]; then
		return 0 # File exists
	else
		return 1 # File does not exist
	fi
}

# Kill already running processes
_ps=(waybar rofi)
for _prs in "${_ps[@]}"; do
	if pidof "${_prs}" >/dev/null; then
		pkill "${_prs}"
	fi
done

# Relaunch waybar
waybar &

exit 0
