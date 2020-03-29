#!/bin/bash

mountpoint=$1

df -h ${mountpoint} | awk 'END {
print "{\"text\":\" "$6" "$4"\", \"tooltip\":\"Filesystem: "$1"\rSize: "$2"\rUsed: "$3"\rAvail: "$4"\rUse%: "$5"\rMounted on: "$6"\", \"class\":\"\"}"
}'