#! /bin/sh

function getBatteries()
{
	bats=()
	
	for bat in /sys/class/power_supply/BAT*
	do
		batsString="$(echo "$(basename $bat): $(cat "$bat/capacity")%%")"
	done
}

function getTime()
{
	timeString="$(date +%Hh%M)"
}

timeString=
batsString=
kernelString="$(uname -r)"

while true
do
	getBatteries
	getTime
	printf "$kernelString | $batsString | $timeString"
	sleep 1
done
