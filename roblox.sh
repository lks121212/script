flatpak -y --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak -y --user install flathub org.vinegarhq.Sober
flatpak run org.vinegarhq.Sober >/dev/null 2>&1 &
