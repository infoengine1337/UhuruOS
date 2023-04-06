#!/bin/sh
#
# silencesuzuka
# Known As: @admin
# Email  : admin@noreply
#
# (c) 1998-2140 team-silencesuzuka
#

# Enable LightDM to auto login
if [[ "${boot_splash}" =  true ]]; then
    systemctl enable lightdm-plymouth.service
else
    systemctl enable lightdm.service
fi

# Replace auto login user
sed -i "s|%USERNAME%|${username}|g" "/etc/lightdm/lightdm.conf.d/02-autologin.conf"

# Replace password for screensaver comment
sed -i s/%PASSWORD%/${password}/g "/etc/dconf/db/local.d/02-disable-lock"

# Update system datebase
dconf update
