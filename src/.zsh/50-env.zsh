if [ $UID -eq 0 ]; then
	umask 022
else
	umask 066
fi

if type nvim > /dev/null; then
	export EDITOR="nvim"
else
	export EDITOR="vim"
fi
export PAGER="less"

export PASSWORD_STORE_DIR="$HOME/Documents/.password-store"
export PASSWORD_STORE_GENERATED_LENGTH=32

if [ -e "/usr/bin/lesspipe" ]; then
	export LESSOPEN='| /usr/bin/lesspipe %s'
	export LESSCLOSE='/usr/bin/lesspipe %s %s'
fi

if [ -n "$TERMINATOR_UUID" -a -z "$TMUX" ]; then
	export TERM=xterm-256color
fi
