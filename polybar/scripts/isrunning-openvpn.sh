#!/bin/sh

if [ "$(pgrep openvpn)" ]; then
    echo "%{F#00acc1}%{F-}"
else
    echo ""
fi
