# If present, add the given directories to $PATH
# Do this before oh-my-zsh starts so that plugins all find the
# correct executables.

export PATH="$HOME/.local/bin:$PATH:/usr/local/go/bin/:/usr/share/virtualenvwrapper:$HOME/.cargo/bin:$HOME/Workspace/go/bin:$HOME/.mix/escripts"
export GOPATH="$HOME/Workspace/go"

if [[ "$PATH" != *"/var/lib/snapd/snap/bin"* ]]; then
	export PATH="$PATH:/var/lib/snapd/snap/bin"
fi

if [[ -e /home/linuxbrew/.linuxbrew/bin ]]; then
	export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
fi

# Extra completions
fpath=(~/.zsh/completions $fpath)
