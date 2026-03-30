flatpak --user remote-add -y --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >/dev/null 2>&1
flatpak --user install -y --noninteractive flathub org.vinegarhq.Sober >/dev/null 2>&1
flatpak run org.vinegarhq.Sober >/dev/null 2>&1 &
