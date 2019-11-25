# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias i3prop='/mnt/Gog/Scripts/i3-get-window-criteria.sh'
alias update='yay -Syyuu --devel'
alias ..='cd ..'
alias clock="tty-clock -s -c -n"
alias c='clear'
alias neo='clear && neofetch | lolcat'
alias gitpac='cd ~/.pacmanity/pacmanity && git pull && cd -'
alias lsd='lsd -ahl1'
alias getkey="xev -event keyboard  | egrep -o 'keycode.*\)'"
alias i3console='/mnt/Gog/Scripts/ipc-trace.py'
alias noises="cd /mnt/Gog/repos/noises/; bundle exec jekyll serve; cd $OLDPWD"
alias keys="mdv /mnt/Gog/repos/system/i3/README.md"
alias sync_noises="rsync -h --progress --stats -r -tgo -p -l -D -C --update /mnt/Gog/repos/noises/_site/ /mnt/Gog/repos/compiled\ noises"
alias pinfo="pamac info"
alias max="unimatrix -a -n -f -l knsgGc -s 100 | lolcat -t -a -s 500"
alias icat="kitty +kitten icat"
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB