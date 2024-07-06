#!/bin/bash

copy_scripts=( up.sh down.sh update-systemd-resolved )

for script in "${copy_scripts[@]}"; do
	cp ./$script /etc/openvpn
	chmod +x /etc/openvpn/$script
done
