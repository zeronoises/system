#! /bin/bash

path=/mnt/Gog/Papers/

new_paper() {
    image=$(ls $path | shuf -n 1)
    feh --bg-fill --no-xinerama $path$image
    notify-send -i $path$image "New Wallpaper" $image
    choose
}

trash_paper() {
    rm $path$image
    notify-send "Trashed" $image
}

choose() {
    text="Wallpaper: "$image
    gxmessage $text -fn 'Droid Sans Mono 11' -buttons "Keep:0","Trash:1","Next:2" -default "Next"
    case $? in
    0)  exit 0
        ;;
    1)  trash_paper
        new_paper
        ;;
    2)  new_paper
        ;;
    esac
    exit 0
}

new_paper
