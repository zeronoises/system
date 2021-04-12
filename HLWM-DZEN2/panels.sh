#!/bin/bash

monitor="$@"
mon=$((monitor-1))
# command_in='herbstclient --idle'
len=$(cat /mnt/Gog/updates.txt | wc -l)
font="Hack Nerd Font:size 14"


# $command_in | while read event; do (herbstclient tag_status $mon | tr -d '\t'); done \
                                | dzen2 -p -fn "$font" -xs $monitor \
                                  -ta c -x 10 -y 3 -h 26 -tw 180 -fg '#DADF67' -bg '#555555'\
                                  -title-name dzentags$monitor &

# $command_in | while read event; do ta=$(herbstclient attr monitors.$mon.tag); \
                                  herbstclient attr tags.by-name.$ta.focused_client.title; done \
                                | dzen2 -p -fn "$font" -xs $monitor \
                                  -ta c -x 200 -y 3 -h 26 -tw 560 -fg '#DADF67' -bg '#555555'\
                                  -title-name dzenwin$monitor &

conky -c /mnt/Gog/repos/system/cdz_net | dzen2 -fn "$font" -xs $monitor\
                                 -x 770 -y 3 -h 26 -tw 260 -ta c -p -bg '#555555'\
                                 -title-name dzennet$monitor &

conky -c /mnt/Gog/repos/system/cdz_disks | dzen2 -fn "$font" -xs $monitor\
                                 -x 1040 -y 3 -h 26 -tw 295 -ta c -p -bg '#555555'\
                                 -title-name dzendisk$monitor &

conky -c /mnt/Gog/repos/system/cdz_mb | dzen2 -fn "$font" -xs $monitor\
                                 -x 1345 -y 3 -h 26 -tw 170 -ta c -p -bg '#555555'\
                                 -title-name dzenmb$monitor &

while true; do (echo "^fg('#DFE148')  ^fg('#DEDEDE')" $len);sleep 15m; done \
                                | dzen2 -fn "$font" -xs $monitor\
                                 -x 1525 -y 3 -h 26 -tw 80 -ta c -p -bg '#555555'\
                                 -title-name dzenarch$monitor &

while sleep 1; do (date +'^fg('#DFE148')  ^fg('#DEDEDE')%a %b %d ^fg('#DFE148')  ^fg('#DEDEDE')%H:%M:%S'); done \
                                | dzen2 -fn "$font" -xs $monitor\
                                 -x 1615 -y 3 -h 26 -w 260  -tw 295 -ta c -p -bg '#555555'\
                                 -title-name dzentime$monitor &

herbstclient emit_hook tag_changed

sleep .1
transset .8 -n dzentags$monitor
transset .8 -n dzenwin$monitor
transset .8 -n dzennet$monitor
transset .8 -n dzendisk$monitor
transset .8 -n dzenmb$monitor
transset .8 -n dzenarch$monitor
transset .8 -n dzentime$monitor
