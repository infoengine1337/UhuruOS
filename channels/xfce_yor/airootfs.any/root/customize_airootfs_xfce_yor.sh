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

# WPScan Update
wpscan --update

# Application categorize
bash -c 'sudo pacman -Sl blackarch | grep installed | cut -d " " -f 2' | /etc/pacman.d/scripts/ba-gen-desktop.sh gen

# download seclists wordlists
su $username -c "mkdir ~/seclists-wordlist"
su $username -c \
    "wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-directories.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-files.txt -P ~/seclists-wordlist"

# Change Theme

#sed -i -E 's@(^    <property name="theme" type="string" value=").*("/>$)@\1Midnight-Night\2@g' "/home/${username}/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml"
#sed -i -E 's@(^    <property name="ThemeName" type="string" value=").*("/>$)@\1Midnight-Night\2@g' "/home/${username}/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml"