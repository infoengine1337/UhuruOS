#!/bin/sh
#
# silencesuzuka
# Known As: @admin
# Email  : admin@noreply
#
# (c) 1998-2140 team-silencesuzuka


code="export QT_QPA_PLATFORMTHEME=qt5ct"
files=(
    "/etc/bash/bashenv"
    "/etc/bash.bashrc"
    "/etc/skel/.profile"
    "/home/${username}/.profile"
)

for file in "${files[@]}"; do
    mkdir -p "$(dirname "${file}")"
    touch "${file}"
    echo "${code}" >> "${file}"
done

unset code files file
