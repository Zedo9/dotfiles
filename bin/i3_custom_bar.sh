#!/bin/sh
net() {
	net="$(/home/c_zouche/dotfiles/bin/netspeed.sh)"
	echo "$net"
}

i3status | while :
do
	read line
	echo "$(net) | $line" || exit 1
done
