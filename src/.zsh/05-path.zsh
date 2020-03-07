# If present, add the given directories to $PATH
# Do this before oh-my-zsh starts so that plugins all find the
# correct executables.

export PATH="$HOME/Bin:$PATH:/usr/local/go/bin/:/usr/share/virtualenvwrapper:$HOME/.cargo/bin:$HOME/Workspace/go/bin"
export GOPATH="$HOME/Workspace/go"

# Extra completions
fpath=(~/.zsh/completions $fpath)
