#!/bin/bash

ip=$(curl -s ifconfig.me)
echo "[*] Tu ip pública es -> $ip"