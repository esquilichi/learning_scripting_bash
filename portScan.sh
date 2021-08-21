#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
        echo -e "\n\n [*] Saliendo..."
        exit 0
}

read -p " [*] Ingrese la direccion IP a escanear: " ip

for port in $(seq 1 65535); do
        timeout 1 bash -c "echo '' < /dev/tcp/$ip/$port" 2</dev/null && echo -e "\n[*] Port $port - OPEN" &
done; wait
