#!/bin/sh
# ---------------------------------------------
#  infoengine1337 UhuruOS i3wm edition
#  show power menu script for rofi
#
#  Watasuke
#  Known As: @Watasuke102
#  Email  : Watasuke102@gmail.com
#
#  (c) 1998-2140 team-silencesuzuka
# ---------------------------------------------

declare -A menu_list=(
  ["Cancel"]=""
  ["Shutdown"]="systemctl poweroff"
  ["Reboot"]="systemctl reboot"
  ["Suspend"]="systemctl suspend"
  ["Lock Screen"]="light-locker-command -l"
  ["Logout"]="i3-msg exit"
)


function main() {
  local -r IFS=$'\n'
  [[ "${#}" -ne 0 ]] && eval "${menu_list[$1]}" || echo "${!menu_list[*]}"
}

main "${@}"
