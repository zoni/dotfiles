# If present, add the given directories to $PATH
# Do this before oh-my-zsh starts so that plugins all find the
# correct executables.

# This one may not always exist, so check to make sure (even though
# non-existant directories in $PATH shouldn't matter).
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$PATH:$HOME/.local/bin"
fi

export PATH="$HOME/Bin:/usr/local/bin:$PATH"

# Extra completions
fpath=(~/.zsh/completions $fpath)
