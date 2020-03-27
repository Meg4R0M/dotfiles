#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/colors-switch.rasi -xoffset -2470 -yoffset -1695"

SDIR="$HOME/.config/polybar/scripts"

# Colors
Mode1=" Dark"
Mode2=" Dark grey"
Mode3=" Dark green"
Mode4=" Dark red"
Mode5=" Green"
Mode6=" Cyan"

# Variable passed to rofi
options="$Mode1\n$Mode2\n$Mode3\n$Mode4\n$Mode5\n$Mode6"

chosen="$(echo -e "$options" | $rofi_command -p "Choose one" -dmenu -selected-row 0)"
case $chosen in
    $Mode1)
        $SDIR/colors.sh -mode1
        ;;
    $Mode2)
        $SDIR/colors.sh -mode2
        ;;
    $Mode3)
        $SDIR/colors.sh -mode3
        ;;
    $Mode4)
        $SDIR/colors.sh -mode4
        ;;
    $Mode5)
        $SDIR/colors.sh -mode5
        ;;
    $Mode6)
        $SDIR/colors.sh -mode6
        ;;
esac