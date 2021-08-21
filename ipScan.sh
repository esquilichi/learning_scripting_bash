#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
		clear
        echo -e "\n\n [*] Saliendo..."
        exit 0
}

echo -e "\n\n [*] Iniciando escaneo..."
read -p " [*] Ingrese la direccion IP a escanear en el formato xxx.xxx.xxx.0: " ip
scan=$(echo $ip | cut -d '.' -f 1,2,3)
for i in $(seq 1 255); do
	timeout 1 bash -c "ping -b -c 1 $scan.$i" > /dev/null && echo "$scan.$i - ACTIVE" &
done; wait
