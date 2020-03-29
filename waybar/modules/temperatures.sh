#!/bin/sh

case "$1" in
    --cm)
        let cm_temp=$(cat /sys/devices/platform/asus-wmi-sensors/hwmon/hwmon1/temp3_input | cut -c 1-2)
        echo "{\"text\": \"$cm_temp°C\", \"class\": \"\"}"
        ;;
    --cpu)
        let cpu_temp=$(cat /sys/devices/platform/asus-wmi-sensors/hwmon/hwmon1/temp1_input | cut -c 1-2)
        echo "{\"text\": \"$cpu_temp°C\", \"class\": \"\"}"
        ;;
    --gpu)
        let gpu_temp=$(cat /sys/devices/pci0000:00/0000:00:03.1/0000:0a:00.0/hwmon/hwmon5/temp1_input | cut -c 1-2)
        echo "{\"text\": \"$gpu_temp°C\", \"class\": \"\"}"
        ;;
    --gpu2)
        let gpu2_temp=$(cat /sys/devices/pci0000:40/0000:40:03.1/0000:41:00.0/hwmon/hwmon6/temp1_input | cut -c 1-2)
        echo "{\"text\": \"$gpu2_temp°C\", \"class\": \"\"}"
        ;;
    --ssd)
        let ssd_temp=$(hddtemp /dev/sda | cut -c57-61)
        echo "{\"text\": \"$ssd_temp°C\", \"class\": \"\"}"
        ;;
    --nvme)
        let nvme_temp=$(cat /sys/devices/pci0000:00/0000:00:01.2/0000:09:00.0/hwmon/hwmon0/temp2_input | cut -c 1-2)
        echo "{\"text\": \"$nvme_temp°C\", \"class\": \"\"}"
        ;;
    *)
        echo "{\"text\": options ?, \"class\": \"\"}"
        ;;
esac