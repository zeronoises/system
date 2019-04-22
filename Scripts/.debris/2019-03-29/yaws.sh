#!/bin/bash

## yaws - yet another wallpaper script. zero@discordia 2019
## requires one argument - either 'new', 'star', 'junk', 'info' or 'choose'
## and the setting of the wallpaper directory below - include final "/"
## depends on feh imagemagick notify-send yad - and an emoji font


paper_dir="/mnt/Gog/Pictures/Wallpaper/"                                                # the wallpaper directory

new_paper() {                                                                           # SET A NEW PAPER
    
    paper="$(shuf yaws_papers -n 1)"                                                    # pick a paper
    paper_name="${paper%.*}"                                                            # strip the ext
    num="$(wc -l < yaws_papers)"                                                        # number of papers
    star_num="$(wc -l < yaws_stars)"                                                    # number of papers in the ⭐ list
    icon="${paper_dir}yaws_icon.png"                                                    # path to the icon (for notify-send)
    is_star="$(grep "$paper" yaws_stars)"                                               # is paper on ⭐ list?
    
    if [ -n "$is_star" ]
    then    {                                                                           # set message appropriately
            message="$paper_name ⭐\n$num papers\n$star_num on ⭐ list"
        }
    else    {
            message="$paper_name \n$num papers\n$star_num on ⭐ list"
        }
    fi
    
    convert "$paper" -resize 'x100' yaws_icon.png                                       # make the icon
    feh --bg-fill --no-xinerama "$paper"                                                # set the paper
    notify-send -i "$icon" "<b>Paper:</b>" "$message"                                   # confirmation notification
    echo "$paper" > yaws_currentpaper                                                   # store paper in currentpaper file
    
}

star_paper() {                                                                          # ADD PAPER TO ⭐ LIST
    
    num="$(wc -l < yaws_papers)"                                                        # number of papers
    cur_paper="$(cat yaws_currentpaper)"                                                # name of the current paper
    paper_name="${cur_paper%.*}"                                                        # strip the ext
    icon="${paper_dir}yaws_icon.png"                                                    # path to the icon
    is_star="$(grep "$cur_paper" yaws_stars)"                                           # is paper on ⭐ list?
    
    if [ -n "$is_star" ]
    then    {                                                                           # set message and move on
            message="$paper_name already on ⭐ list"
        }
    else    {
            echo "$cur_paper"  >> yaws_stars                                            # add paper to ⭐ list
            sort -t= yaws_stars -o yaws_stars
            message="$paper_name added to ⭐ list"
        }
    fi
    
    star_num="$(wc -l < yaws_stars)"                                                    # number of papers in the ⭐ list
    notify-send -i "$icon" "$message" "$star_num ⭐ of $num"
    
}

junk_paper() {                                                                          # DELETE A PAPER
    
    cur_paper="$(cat yaws_currentpaper)"
    paper_name="${cur_paper%.*}"
    icon="${paper_dir}yaws_icon.png"
    is_star="$(grep "$cur_paper" yaws_stars)"
    
    if [ -n "$is_star" ]
    then {
            message="Delete ⭐"
        }
    else {
            message="Delete"
        }
    fi
    
    yad --text "$message $paper_name?" --text-align=center \
        --button=gtk-yes:1 --button=gtk-no:0 --buttons-layout=center \
        --width=300 --height=100 \
        --image="$icon" \
        --borders=10 --fixed --center \
        --class=yaws --title=yaws
    opt=$?
    
    if [ $opt -eq 1 ]
    then    {
            if [ -n "$is_star" ]
            then    {
                    message="Deleted $paper_name & removed from ⭐ list"
                    sed -i "/${cur_paper}/d" yaws_stars
                }
            else    {
                    message="Deleted $paper_name"
                }
            fi
            
            rm "$cur_paper" &&
            ls -1 --hide=yaws_* > yaws_papers
            num="$(wc -l < yaws_papers)"
            star_num="$(wc -l < yaws_stars)"
            notify-send "$message" "$num papers left\n$star_num on ⭐ list"
            new_paper
        }
    fi
    
}

info_paper() {                                                                          # INFO ON CURRENT PAPER
    
    cur_paper="$(cat yaws_currentpaper)"                                                # name of the current paper
    stats="$(feh -L "%wx%h %t %S" "$cur_paper")"                                        # format, dimensions & size
    paper_name="${cur_paper%.*}"                                                        # striip ext
    num="$(wc -l < yaws_papers)"                                                        # number of papers
    star_num="$(wc -l < yaws_stars)"                                                    # number of papers in the ⭐ list
    icon="${paper_dir}yaws_icon.png"                                                    # path to the icon
    is_star="$(grep "$cur_paper" yaws_stars)"                                           # is paper on ⭐ list?
    
    if [ -n "$is_star" ]
    then    {
            message="on the ⭐ list\n$num papers on file\n$star_num on the ⭐ list"
        }
    else    {
            message="$num papers on file\n$star_num on the ⭐ list"
        }
    fi
    
    yad --text "$stats\n$message" --text-align=center \
        --button="<big><big>$paper_name</big></big>":0 --buttons-layout=center \
        --width=300 --height=100 \
        --image="$icon" \
        --borders=10 --fixed --center \
        --class=yaws --title=yaws
    
}

choose_star() {                                                                        # CHOOSE FROM ⭐ PAPERS
    
    num="$(wc -l < yaws_papers)"
    star_num="$(wc -l < yaws_stars)"
    icon="${paper_dir}yaws_icon.png"
    
    if [ "$star_num" -ne 0 ]
    then    {
            feh -q -d --draw-tinted -f yaws_stars --scale-down \
                -C /usr/share/fonts/noto/ -e NotoSans-Regular/12 \
                --title yawstars -z -g 800x300 -B black --no-menus \
                --action "echo %F > yaws_currentpaper; kill %V"

            paper=$(cat yaws_currentpaper)
            paper_name="${paper%.*}"
            message="$paper_name ⭐\n$num papers\n$star_num on ⭐ list"

            convert "$paper" -resize 'x100' yaws_icon.png
            feh --bg-fill --no-xinerama "$paper"
            notify-send -i "$icon" "<b>Paper:</b>" "$message"
        }
    else    {
            notify-send "No papers on the ⭐ list yet"
        }
    fi
}

# START HERE

cd "$paper_dir" || exit                                                                 # move to wallpaper dir

ls -1 --hide=yaws_* > yaws_papers                                                       # update the list of all papers

if [ ! -e yaws_currentpaper ]                                                           # first time use
then        {                                                                           # delete yaws_currentpaper to simultate
        > yaws_currentpaper
        > yaws_stars
        new_paper
    }
else    {
        case $1 in
            new)
                new_paper
            ;;
            star)
                star_paper
            ;;
            junk)
                junk_paper
            ;;
            info)
                info_paper
            ;;
            choose)
                choose_star
            ;;
        esac
    }
fi

num="$(wc -l < yaws_papers)"                                                            # are all papers are on ⭐ list?
star_num="$(wc -l < yaws_stars)"
if [ "$star_num" = "$num" ]
then   	    {
        notify-send "All papers are on the ⭐ list" "$star_num ⭐ of $num"
    }
fi

cd "$OLDPWD" || return                                                                  # go back to where we started from
