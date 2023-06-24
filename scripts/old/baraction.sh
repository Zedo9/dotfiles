#!/bin/sh
# Bar Action
# Requires: acpi, iostat.

# print_mem() {
#	MEM=`/usr/bin/free -m | grep ^Mem: | sed -E 's/ +/ /g' | cut -d ' ' -f4`
#	echo -n "Free mem: ${MEM}M  "
# }

# _print_cpu() {
#	printf "CPU: %3d%% User %3d%% Nice %3d%% Sys %3d%% Idle  " $1 $2 $3 $6
# }

# print_cpu() {
#	OUT=""
#	# Remove the decimal part from all the percentages.
#	while [ "${1}x" != "x" ]; do
#		OUT="$OUT `echo "${1}" | cut -d '.' -f1`"
#		shift;
#	done
#	_print_cpu $OUT
# }

print_cpuspeed() {
	CPU_SPEED=`/usr/bin/lscpu | grep '^CPU MHz:' | sed -E 's/ +/ /g' | cut -d ' ' -f3 | cut -d '.' -f1`
	printf " CPU speed: %4d MHz  " $CPU_SPEED
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -n " $mem "
}


## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -n "CPU: $cpu% |"
}

## VOLUME
vol() {
	vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
    echo -n "| VOL: $vol "
}

net(){
	# Choose your device accordingly
	R1=`cat /sys/class/net/wlp3s0/statistics/rx_bytes`
	T1=`cat /sys/class/net/wlp3s0/statistics/tx_bytes`
	sleep 1
	R2=`cat /sys/class/net/wlp3s0/statistics/rx_bytes`
	T2=`cat /sys/class/net/wlp3s0/statistics/tx_bytes`
	TBPS=`expr $T2 - $T1`
	RBPS=`expr $R2 - $R1`
	TKBPS=`expr $TBPS / 1024`
	RKBPS=`expr $RBPS / 1024`
	echo -n "| NET :  $RKBPS  kB/s/ $TKBPS kB/s"
}


print_bat() {
	AC_STATUS="$3"
	BAT_STATUS="$6"
	# Most battery statuses fit into a single word, except "Not charging"
	# for which we need to have special handling.
	if [ "$BAT_STATUS" = "Not" ]; then
		BAT_STATUS="$BAT_STATUS $7"
		shift
	fi
	BAT_LEVEL="`echo "$7" | tr -d ','`"

	if [ "$AC_STATUS" != "" -o "$BAT_STATUS" != "" ]; then
		if [ "$BAT_STATUS" = "Discharging," ]; then
			echo -n "on battery ($BAT_LEVEL)"
		else
			case "$AC_STATUS" in
			on-line)
				AC_STRING="| on AC: "
				;;
			*)
				AC_STRING=""
				;;
			esac
			case "$BAT_STATUS" in
			"")
				BAT_STRING="no battery "
				;;
			*harging,|Full,)
				BAT_STRING="battery $BAT_LEVEL "
				;;
			*)
				BAT_STRING="battery unknown "
				;;
			esac

			FULL="${AC_STRING}${BAT_STRING}"
			if [ "$FULL" != "" ]; then
				echo -n "$FULL"
			fi
		fi
	fi
}

# Cache the output of acpi(8), no need to call that every second.
# ACPI_DATA=""
# I=0
# while :; do
#	IOSTAT_DATA=`/usr/bin/iostat -c | grep '[0-9]$'`
#	if [ $I -eq 0 ]; then
#		ACPI_DATA=`/usr/bin/acpi -a 2>/dev/null; /usr/bin/acpi -b 2>/dev/null`
#	fi
#	cpu
#	mem
#	# print_mem
#	# print_cpuspeed
#	print_bat $ACPI_DATA
#	vol
#	net
#	echo ""
#	I=$(( ( ${I} + 1 ) % 11 ))
#	sleep 1
# done
