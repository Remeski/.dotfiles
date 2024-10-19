#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

CRITICAL_ACK_FILE=/tmp/criticalAck
LOW_ACK_FILE=/tmp/lowAck

BAT=BAT0
AC=AC0
BATTERY_LEVEL=$(cat /sys/class/power_supply/$BAT/capacity)
CHARGING=$(cat /sys/class/power_supply/$AC/online)
#BATTERY_LEVEL="20"
#CHARGING="0"
LOW_WARNING_LEVEL="21"
CRITICAL_WARNING_LEVEL="11"

send_low_warning () {
				local ack=$(notify-send -A ack -a batterynotifier -i battery-010-symbolic "Low Battery!" "Consider charging?")
				echo $ack
}
send_critical_warning () {
				local ack=$(notify-send -A ACK=Ack -a batterynotifier -i battery-000-symbolic -u critical "Critically low Battery!" "Imma shut down if you dont charge.")
				echo $ack
}

if [[ $CHARGING == "1" ]]; then
				if [ -f $CRITICAL_ACK_FILE ]; then
								rm $CRITICAL_ACK_FILE 
				fi
				if [ -f $LOW_ACK_FILE ]; then
								rm $LOW_ACK_FILE 
				fi
fi

if [[ $CHARGING == "0" ]] && [ $BATTERY_LEVEL -lt $CRITICAL_WARNING_LEVEL ] && [ ! -f $CRITICAL_ACK_FILE ]; then
				ack=$(send_critical_warning)
				if [ ! -z $ack ]; then 
								touch $CRITICAL_ACK_FILE
				fi
				exit
fi

if [[ $CHARGING == "0" ]] && [ $BATTERY_LEVEL -lt $LOW_WARNING_LEVEL ] && [ ! -f $LOW_ACK_FILE ]; then
				ack=$(send_low_warning)
				if [ ! -z $ack ]; then 
								touch $LOW_ACK_FILE
				fi
				exit
fi


