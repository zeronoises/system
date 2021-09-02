# /etc/profile

# Set our umask
umask 022

# Append our default paths
append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'
unset append_path

export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Source global bash config
if test "$PS1" && test "$BASH" && test -z ${POSIXLY_CORRECT+x} && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

# setxkbmap -layout gb

export QT_QPA_PLATFORMTHEME="qt5ct"

PATH="/usr/sbin:/sbin:/usr/games:$PATH"
export QT_STYLE_OVERRIDE=kvantum

# start tdm
sh $HOME/.cache/wal/colors-tty.sh
tdm
