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

function getRamUsage()
{
	ramUsage="$(free -h | awk 'NR==2 { print $3"/"$2 }')"
}

timeString=
batsString=
ramUsage="NaN/Nan"
kernelString="$(uname -r)"

while true
do
	getBatteries
	getTime
	getRamUsage
	printf "RAM: $ramUsage | $kernelString | $batsString | $timeString"
	sleep 1
done
