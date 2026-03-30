flatpak -y --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak -y --user install flathub com.valvesoftware.Steam
flatpak run com.valvesoftware.Steam