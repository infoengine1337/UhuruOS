#!/usr/bin/env bash
#
# Yamada Hayao
# Twitter: @Hayao0819
# Email  : hayao@fascode.net
#
# (c) 2019-2021 Fascode Network.
#

# Replace wallpaper.
#if [[ -f /usr/share/backgrounds/xfce/xfce-verticals.png ]]; then
#    remove /usr/share/backgrounds/xfce/xfce-verticals.png
#    ln -s /usr/share/backgrounds/arch-logo-dark/ALDark1.png /usr/share/backgrounds/xfce/xfce-verticals.png
#fi
#[[ -f /usr/share/backgrounds/arch-logo-dark/ALDark1.png ]] && chmod 644 /usr/share/backgrounds/arch-logo-dark/ALDark1.png

VERSION_WHO='16.0.9.8'

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


# Change Theme

#sed -i -E 's@(^    <property name="theme" type="string" value=").*("/>$)@\1Midnight-Night\2@g' "/home/${username}/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml"
#sed -i -E 's@(^    <property name="ThemeName" type="string" value=").*("/>$)@\1Midnight-Night\2@g' "/home/${username}/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml"