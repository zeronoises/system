#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias i3prop='/mnt/Gog/Scripts/i3-get-window-criteria.sh'
alias update='yay -Syyuu --devel'
alias ..='cd ..'
alias clock="tty-clock -s -c -n"
alias c='clear'
alias neo='clear && neofetch'
alias gitpac='cd ~/.pacmanity/pacmanity && git pull && cd -'
alias cdz='cd /mnt/Gog'
alias cds='cd /mnt/Gog/Scripts'
alias cdt='cd /mnt/Gog/Temp'
alias cdr='cd /mnt/Gog/repos'
alias lsd='lsd -al1'
alias cmatrix='cmatrix -b -s | lolcat -t'
alias getkey="xev -event keyboard  | egrep -o 'keycode.*\)'"
alias i3console='/mnt/Gog/Scripts/ipc-trace.py'
alias ll="ls -Hal | less"
alias noises="cd /mnt/Gog/repos/noises/; bundle exec jekyll serve; cd $OLDPWD"

PS1="\[\e[33m\]\A\[\e[m\] \[\e[31m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] \[\e[35m\][\[\e[m\]\[\e[35m\]\W\[\e[m\]\[\e[35m\]]\[\e[m\] > "

#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

complete -cf sudo man
shopt -s checkwinsize
export LESS=" -iMFXR"

    ufetch | lolcat
    fortune oblique-strategies | lolcat


eval "$(thefuck --alias)"
