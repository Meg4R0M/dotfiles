#!/bin/bash

pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
    temp=$(redshift -p 2>/dev/null | grep Temp | cut -d' ' -f4)
    temp=${temp//K/}
fi

# OPTIONAL: Append ' ${temp}K' after $icon
if [[ -z $temp ]]; then
    echo "{\"text\": \"OFF\", \"class\": \"\"}"
else
    echo "{\"text\": \"${temp}K\", \"class\": \"\"}"
fi
