#!/bin/bash

for config in "$@"; do
	echo "# update systemd-resolved before and after connecting
script-security 2
up '/bin/bash -c \"/etc/openvpn/up.sh; /etc/openvpn/update-systemd-resolved\"'
down '/bin/bash -c \"/etc/openvpn/down.sh; /etc/openvpn/update-systemd-resolved\"'
# run on restarts, and before the device is closed
up-restart
down-pre
# send all DNS queries over the VPN
dhcp-option DOMAIN-ROUTE ." >> $config
done
