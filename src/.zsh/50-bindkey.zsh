# Enable vi mode
bindkey -v

bindkey '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

bindkey '\e.' insert-last-word
bindkey '\eu' undo
bindkey -M vicmd '\eu' undo

# The next two keys are the up and down arrow keys respectively
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
