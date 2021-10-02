#! /bin/bash

# Realtime configuration script to connect to wireless networks
# Made for gentoo with OpenRC and wpa_supplicant

if [ $EUID -ne 0 ]; then
	printf "This script should be run as root\n"
	exit 1
fi

WPA_SUPPLICANT_CONF_DIR=/etc/wpa_supplicant

confs=()

for f in "$WPA_SUPPLICANT_CONF_DIR"/*.conf; do
	if [ "$f" != "$WPA_SUPPLICANT_CONF_DIR/wpa_supplicant.conf" ]; then
		confs+=("$f")
	fi
done

printf "List of configured wifi access points\n"

for i in ${!confs[@]}; do
	printf "\033[1;34m$i\033[0m\t$(basename -s '.conf' ${confs[$i]})\n"
done

printf "Connect to: "

read number

if [ $number -ge ${#confs[@]} ]; then
	printf "Index out of range\n"
	exit 1
fi

ln -sf "${confs[$number]}" "$WPA_SUPPLICANT_CONF_DIR/wpa_supplicant.conf"

/etc/init.d/wpa_supplicant restart
