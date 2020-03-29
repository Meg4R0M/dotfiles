#!/bin/sh

case "$1" in
    --clean)
        rm -rf ~/.local/share/Trash/files
        rm -rf ~/.local/share/Trash/info
        mkdir ~/.local/share/Trash/files
        mkdir ~/.local/share/Trash/info
        ;;
    *)
        if [ -r ~/.local/share/Trash/files ]; then
            let items=$(find ~/.local/share/Trash/files/ -maxdepth 1 | wc -l)
        else
            let items=0
        fi
        echo "{\"text\": $items, \"class\": \"\"}"
        ;;
esac