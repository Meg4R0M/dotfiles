#!/bin/sh

IP=$(dig +short myip.opendns.com @resolver1.opendns.com -4)

if pgrep -x openvpn > /dev/null; then
    echo "{\"text\": \" $IP\", \"class\": \"\"}"
else
    echo "{\"text\": \" $IP\", \"class\": \"\"}"
fi
