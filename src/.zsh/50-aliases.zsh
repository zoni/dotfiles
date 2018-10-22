alias tree="tree -C -L 2"
alias t="tree"
function treeless() {
	tree $@ | less
}
alias tl="treeless"

function onchange() {
	while true; do inotifywait -qq -r . -e modify -e create -e moved_to -e delete; eval "$@"; done
}

case $(uname -s) in
	Linux)
		alias ls="ls --color=auto"
		;;
	FreeBSD)
		alias ls="ls -G -I"
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
alias notify-on-complete='notify-send --urgency=normal --icon ${${?/0/terminal}//<->*/error} "Command finished${${?/0/}//<->*/ with error}" ${history[$HISTCMD]%[;&|]*}'
alias print-color-table='for i in {0..255} ; do printf "\x1b[38;5;${i}mcolor${i}\n" ; done | column'
alias psgrep="ps aux | grep"
alias ssh-nomaster="ssh -S none"
alias stream2chromecast="stream2chromecast -port 32872"
alias tmux="tmux -2"
alias ts="tmuxsession"
alias unison="unison -ui text"
alias xclip="xclip -selection clipboard"

if [[ $XDG_CURRENT_DESKTOP == "i3" ]]; then
	# This is required for gnome-control-center to work properly under i3.
	# Without this, no data is populated.
	alias gnome-control-center="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
fi
