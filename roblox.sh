#!/bin/bash

set -e

flatpak --user remote-add -y --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >/dev/null 2>&1

if ! flatpak info org.vinegarhq.Sober >/dev/null 2>&1; then
  flatpak --user install -y --noninteractive flathub org.vinegarhq.Sober >/dev/null 2>&1
fi

flatpak run org.vinegarhq.Sober >/dev/null 2>&1 &