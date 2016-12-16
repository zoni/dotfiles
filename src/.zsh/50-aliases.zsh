alias tree="tree -C -L 2"
alias t="tree"
function treeless() {
	tree $@ | less
}
alias tl="treeless"

alias ls="ls --color=auto"
alias l="ls -h"
alias la="ls -hA"
alias ll="ls -hl"
alias lla="ls -hlA"
alias lal="ls -hlA"

alias p="pushd"
alias P="popd"
alias d='dirs -v | head -10'

alias gpg="gpg2 --keyid-format long"
alias xclip="xclip -selection clipboard"
alias tmux="tmux -2"
alias ts="tmuxsession"
alias histgrep="history 0 | grep"
alias psgrep="ps aux | grep"
alias unison="unison -ui text"
alias notify-on-complete='notify-send --urgency=normal --icon ${${?/0/terminal}//<->*/error} "Command finished${${?/0/}//<->*/ with error}" ${history[$HISTCMD]%[;&|]*}'
alias ssh-nomaster="ssh -S none"
alias dotfiles.sh="dotfiles.sh --dotfiles-dir ~/.dotfiles"
