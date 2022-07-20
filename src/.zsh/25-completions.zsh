# See also https://thevaluable.dev/zsh-completion-guide-examples/

# Make completion matches case-insensitive
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Make completion matches case-insensitive and match on partial words
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Enable a menu for completions
zstyle ':completion:*' menu yes select

# Make menu completion of files use the same colors as ls (set via $LS_COLORS)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Group completions by source
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %d --%f'
zstyle ':completion:*' group-name ''

# Configure the `ps` invocation used to complete process lists (for example to
# complete the kill command)
zstyle ':completion:*:*:*:*:processes' command "ps x -o pid,user,comm,cmd"
