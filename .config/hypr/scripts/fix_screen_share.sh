#!/usr/bin/bash
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal

systemctl restart --user pipewire.service
sleep 1
systemctl restart --user pipewire-pulse
sleep 1
/usr/lib/xdg-desktop-portal-hyprland &!
sleep 2
/usr/lib/xdg-desktop-portal &!
