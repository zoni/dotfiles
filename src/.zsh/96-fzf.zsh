if [ -e /usr/share/fzf -o -e /usr/local/opt/fzf/ -o -e /home/linuxbrew/.linuxbrew/opt/fzf/ ]; then
	if [ -e /home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.zsh ]; then
		source /home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.zsh  # Linuxbrew
	elif [ -e /usr/share/fzf/key-bindings.zsh ]; then
		source /usr/share/fzf/key-bindings.zsh  # Arch Linux
	elif [ -e /usr/share/fzf/shell/key-bindings.zsh ]; then
		source /usr/share/fzf/shell/key-bindings.zsh  # Fedora
	elif [ -e /usr/local/opt/fzf/shell/key-bindings.zsh ]; then
		source /usr/local/opt/fzf/shell/key-bindings.zsh  # Mac OS
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
