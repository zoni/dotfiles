alias tree="tree -C -L 2"
alias t="tree"
function treeless() {
	tree $@ | less
}
alias tl="treeless"

case $(uname -s) in
	Linux)
		alias ls="ls --color=auto"
		;;
	FreeBSD)
		alias ls="ls -G -I"
		;;
	Darwin)
		alias ls="ls -G"
		;;
esac
alias l="ls -h"
alias la="ls -hA"
alias ll="ls -hl"
alias lla="ls -hlA"
alias lal="ls -hlA"

alias p="pushd"
alias P="popd"
alias d='dirs -v | head -10'

alias dotfiles.sh="dotfiles.sh --dotfiles-dir ~/.dotfiles"
alias gpg="gpg2 --keyid-format long"
alias histgrep="history 0 | grep"
alias print-color-table='for i in {0..255} ; do printf "\x1b[38;5;${i}mcolor${i}\n" ; done | column'
alias psgrep="ps aux | grep"
alias ssh-nomaster="ssh -S none"
alias tmux="tmux -2"
alias ts="tmuxsession"
alias xclip="xclip -selection clipboard"
