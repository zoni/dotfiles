export EDITOR="vim"
export PAGER="less"

if [ -e "/usr/bin/lesspipe" ]; then
	export LESSOPEN='| /usr/bin/lesspipe %s'
	export LESSCLOSE='/usr/bin/lesspipe %s %s'
fi
