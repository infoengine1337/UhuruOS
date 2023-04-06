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

VERSION_WHO='16.0.9.0'

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

# Whonix gateway download & install

URL="https://download.whonix.org/ova/$VERSION_WHO/Whonix-XFCE-$VERSION_WHO.ova" 

su $username -c "wget -O /home/$username/tmp.ova $URL"
su $username -c "vboxmanage import /home/$username/tmp.ova --vsys 0 --eula accept --vsys 1 --eula accept"
su $username -c "rm /home/$username/tmp.ova"
