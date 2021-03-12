#! /bin/bash

path=/mnt/Gog/Papers/

new_paper() {
    image=$(ls $path | shuf -n 1)
    feh --bg-fill --no-xinerama $path$image
    notify-send "New Wallpaper" $image
    choose
}

trash_paper (){
    rm $path$image
    notify-send "Trashed" $image
}

choose() {
    choice=$(printf "Keep\nTrash\nNext" | dmenu -i -bw 2 -c -fn "Droid Sans Mono-14")
    case "$choice" in
    Keep) exit 0
        ;;
    Trash) trash_paper
           new_paper
        ;;
    Next) new_paper
        ;;
    esac
    exit 0
}

new_paper

