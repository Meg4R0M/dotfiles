#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command="rofi -theme themes/apps.rasi -xoffset -3370 -yoffset -1960"

# Links
terminal=""
files="ﱮ"
editor=""
browser=""
music=""
settings="漣"

# Variable passed to rofi
options="$terminal\n$files\n$editor\n$browser\n$music\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
        termite &
        ;;
    $files)
        thunar &
        ;;
    $editor)
        geany &
        ;;
    $browser)
        firefox &
        ;;
    $music)
        lxmusic &
        ;;
    $settings)
        xfce4-settings-manager &
        ;;
esac
