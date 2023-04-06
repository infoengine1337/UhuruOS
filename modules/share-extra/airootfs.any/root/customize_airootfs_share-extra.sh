#!/bin/sh
#
# silencesuzuka
# Known As: @admin
# Email  : admin@noreply
#
# (c) 1998-2140 team-silencesuzuka
#

chattr +i /etc/resolv.conf

# Bluetooth
rfkill unblock all
_safe_systemctl enable bluetooth
_safe_systemctl enable ufw.service


# Added autologin group to auto login
_groupadd autologin
usermod -aG autologin ${username}


# ntp
_safe_systemctl enable systemd-timesyncd.service


# Update system datebase
if type -p dconf 1>/dev/null 2>/dev/null; then
    dconf update
fi


# Change aurorun files permission
chmod 755 "/home/${username}/.config/autostart/"* "/etc/skel/.config/autostart/"* || true
chmod +x /usr/bin/uhurukey-en /usr/bin/uhurukey-ja
