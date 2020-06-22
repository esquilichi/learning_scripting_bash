#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
	echo -e "\n\n [*] Saliendo..."
	exit 0
}

for port in $(seq 1 65535); do 
	timeout 1 bash -c "echo '' < /dev/tcp/192.168.1.1/$port" 2</dev/null && echo "Port $port - OPEN" &
done; wait
