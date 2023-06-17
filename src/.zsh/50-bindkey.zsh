# Enable vi mode
bindkey -v
# Make switch between modes faster
export KEYTIMEOUT=1

# The "Completion listing extensions" is needed for some of the later key
# bindings
zmodload zsh/complist

bindkey '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

bindkey '\e.' insert-last-word
bindkey '\eu' undo
bindkey -M vicmd '\eu' undo

zle -N history-substring-search-up
zle -N history-substring-search-down
# The next two keys are the up and down arrow keys respectively
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey '\t' menu-select "$terminfo[kcbt]" expand-or-complete
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# Make menu completions more vi-like.
# hklj naviation:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Make escape cancel menu completion:
bindkey -M menuselect '\e' send-break

# Make vi mode support text objects. Taken from
# https://thevaluable.dev/zsh-install-configure-mouseless/#adding-text-objects
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done
