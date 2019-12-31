# discordia 2019
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias i3prop='/mnt/Gog/Scripts/i3-get-window-criteria.sh'
alias update='yay -Syyuu --devel'
alias ..='cd ..'
alias clock="tty-clock -s -c -n"
alias c='clear'
alias neo='clear && neofetch'
alias gitpac='cd ~/.pacmanity/pacmanity && git pull && cd -'
alias ls='lsd -ahl1'
alias getkey="xev -event keyboard  | egrep -o 'keycode.*\)'"
alias i3console='/mnt/Gog/Scripts/ipc-trace.py'
alias noises="cd /mnt/Gog/repos/noises/; bundle exec jekyll serve; cd $OLDPWD"
alias keys="mdv /mnt/Gog/repos/system/i3/README.md"
alias sync_noises="rsync -h --progress --stats -r -tgo -p -l -D -C --update /mnt/Gog/repos/noises/_site/ /mnt/Gog/repos/compiled\ noises"
alias pinfo="pamac info"
alias max="unimatrix -a -f -s 95 -l aAcCgGknS -c cyan"
alias icat="kitty +kitten icat"
alias feh="feh --scale-down"
alias w="wd"
alias wl="wd list"
alias sn_capture="jack_capture --channels 3 --port Decks:capture_1 --port Decks:capture_2 --port system:capture_2"
# alias on_capture="jack_capture --channels 3 --port Mixxx:out_2 --port Mixxx:out_3 --port system:capture_2"
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias disco='TERM=vt100 ssh disco'
alias mdisco="sshfs disco:/ /mnt/Gog/disco"
alias udisco="umount /mnt/Gog/disco"

# suffix
alias -s {cpp,cxx,cc,c,hh,h,inl,asc,txt,TXT,tex}=nano
alias -s {ape,avi,flv,m4a,mkv,mov,mp3,mp4,mpeg,mpg,ogg,ogm,rm,wav,webm}=mplayer
alias -s {png,gif,bmp,tif}="feh --scale-down"
alias -s {jpg,JPG,jpeg}="feh --scale-down --auto-rotate"
alias -s svg="feh --conversion-timeout 1"
alias -s md=mdv
