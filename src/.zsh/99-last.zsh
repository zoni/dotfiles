# https://asdf-vm.com/guide/getting-started.html#_3-install-asdf states:
#
#   > asdf scripts need to be sourced after you have set your $PATH and after you
#   > have sourced your framework (oh-my-zsh etc).
[[ -e /opt/asdf-vm/asdf.sh ]] && source /opt/asdf-vm/asdf.sh

# zsh-syntax-highlighting must be run before zsh-history-substring-search.
# Furthermore, it must be loaded last, as explained on
# https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
zgenom load zsh-users/zsh-syntax-highlighting
zgenom load zsh-users/zsh-history-substring-search
