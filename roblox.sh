#!/bin/bash
set -e

flatpak --user remote-add -y --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

if ! flatpak info org.vinegarhq.Sober >/dev/null 2>&1; then
  flatpak --user install -y flathub org.vinegarhq.Sober
fi

flatpak run org.vinegarhq.Sober
