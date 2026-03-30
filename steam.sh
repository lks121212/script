flatpak --user remote-add -y --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >/dev/null 2>&1
flatpak --user install -y --noninteractive flathub com.valvesoftware.Steam >/dev/null 2>&1
flatpak run com.valvesoftware.Steam >/dev/null 2>&1 &
