if [ -e /usr/share/fzf ]; then
	if [ -e /usr/share/fzf/key-bindings.zsh ]; then
		source /usr/share/fzf/key-bindings.zsh  # Arch Linux
	elif [ -e /usr/share/fzf/shell/key-bindings.zsh ]; then
		source /usr/share/fzf/shell/key-bindings.zsh  # Fedora
	fi

	if type fd > /dev/null; then
		export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git"
		export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND} --type directory"
	else
		export FZF_DEFAULT_COMMAND="find ."
		export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND} -type d"
	fi

	export FZF_DEFAULT_OPTS='--no-height'
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	export FZF_CTRL_T_OPTS="--preview 'test -d {} && tree -L 1 --filelimit 30 {} || head -200 {}' --preview-window down:50%"
fi
