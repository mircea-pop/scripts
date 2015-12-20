#!/bin/bash
while [ "true" ]
do
	VPNCON=$(nmcli con status)
	if [[ $VPNCON != *BTGuard* ]]; then
		echo "Disconnected, trying to reconnect..."
		(sleep 1s && nmcli con up uuid 92688f0a-3db4-4d43-b41d-7700d27ac422)
	else
		echo "Already connected !"
	fi
	sleep 60
done
