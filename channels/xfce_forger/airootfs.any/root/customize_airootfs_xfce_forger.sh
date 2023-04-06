#!/bin/sh
#
# silencesuzuka
# Known As: @admin
# Email  : admin@noreply
#
# (c) 1998-2140 team-silencesuzuka
#

# Change wallpaper
XFCE4_FIRSTBG="/usr/share/backgrounds/xfce/xfce-shapes.svg"
mv "/usr/share/backgrounds/xfce/user-default.png" "${XFCE4_FIRSTBG}"

# Replace right menu
if [[ "${language}" = "ja" ]]; then
    remove "/etc/skel/.config/Thunar/uca.xml"
    remove "/home/${username}/.config/Thunar/uca.xml"

    mv "/etc/skel/.config/Thunar/uca.xml.jp" "/etc/skel/.config/Thunar/uca.xml"
    mv "/home/${username}/.config/Thunar/uca.xml.jp" "/home/${username}/.config/Thunar/uca.xml"
else
    remove "/etc/skel/.config/Thunar/uca.xml.jp"
    remove "/home/${username}/.config/Thunar/uca.xml.jp"
fi

# Enable zeronet
_safe_systemctl enable zeronet.service
chmod +x /usr/lib/start-zeronet
usermod -aG tor zeronet
