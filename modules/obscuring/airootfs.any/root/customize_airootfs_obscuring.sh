#
# Uhuru OS shell script
#
# infoengine1337
# Known As: @infoengine1337

_safe_systemctl mask systemd-timesyncd.service
_safe_systemctl enable iptables.service ip6tables.service macspoof.service NetworkManager.service dnsmasq.service secure-time-sync.service kloak.service
#_safe_systemctl mask tor.service

# Tor Initializer
chmod +x /usr/lib/obscurix/secure-time-sync
