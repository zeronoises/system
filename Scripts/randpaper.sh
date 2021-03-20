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
    notify-send -i $path$image "Trashed" $image
}

choose() {
    choice=$(printf "Keep\nTrash\nNext" | dmenu -p $image -i -sb '#4586A6' -fn "Droid Sans Mono-14")
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
