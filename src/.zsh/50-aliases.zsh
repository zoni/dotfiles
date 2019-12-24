alias tree="tree -C -L 2"
alias t="tree"
function treeless() {
	tree $@ | less
}
alias tl="treeless"

if type knowledgebase > /dev/null; then
	function knowledgebase() {
		if [ "$#" -lt 1 ]; then
			cd "$HOME/Workspace/knowledgebase"
			git status --short
		else
			# Determine the real knowledgebase binary path to avoid endless
			# self-recursion.  Calling /bin/which avoids shell built-ins
			# otherwise we'd still get the function alias.
			#
			# This trickery is needed because aliases are expanded when a
			# function definition is read, not when the function is executed.
			$(/bin/which knowledgebase) "$@"
		fi
	}
	alias kb=knowledgebase
fi

function onchange() {
	while true; do inotifywait -qq -r . -e modify -e create -e moved_to -e delete --exclude '/\.git/'; eval "$@"; done
}

function mix-release-version() {
	sed -i -E "s/version: \".+\"/version: \"$1\"/" mix.exs
	git add mix.exs
	git --no-pager diff --staged
	echo -n "\n\nContinue?"
	read
	git commit -m "Release v$1"
	git tag v$1
	git push origin HEAD
	git push origin v$1
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

alias diff="git diff --color=auto --no-ext-diff --no-index"
alias dotfiles.sh="dotfiles.sh --dotfiles-dir ~/.dotfiles"
alias gpg="gpg2 --keyid-format long"
alias histgrep="history 0 | grep"
alias notify-on-complete='notify-send --urgency=normal --icon ${${?/0/terminal}//<->*/error} "Command finished${${?/0/}//<->*/ with error}" ${history[$HISTCMD]%[;&|]*}'
alias print-color-table='for i in {0..255} ; do printf "\x1b[38;5;${i}mcolor${i}\n" ; done | column'
alias psgrep="ps aux | grep"
alias stream2chromecast="stream2chromecast -port 32872"
alias tmux="tmux -2"
alias ts="tmuxsession"
alias unison="unison -ui text"
alias xclip="xclip -selection clipboard"

if ((ARCHLINUX)); then
	alias yayr="yay --repo"
	alias yaya="yay --aur"
fi

if [[ $XDG_CURRENT_DESKTOP == "i3" ]]; then
	# This is required for gnome-control-center to work properly under i3.
	# Without this, no data is populated.
	alias gnome-control-center="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
fi

alias ga="git ahead"
alias gadd="git add"
alias gaddp="git add --patch"
alias gb="git behind"
alias gbr="git branch"
alias gbrD="git branch -D"
alias gbrd="git branch -d"
alias gc="git commit --verbose"
alias gca="git commit --amend"
alias gco="git checkout"
alias gcoB="git checkout -B"
alias gcob="git checkout -b"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gfetch="git fetch"
alias gg="git grep"
alias gl="git compactlog"
alias gm="git merge"
alias gmff="git merge --ff-only"
alias gmnoff="git merge --no-ff"
alias gn="git new"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gpull="git pull"
alias gpush="git push"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase --interactive"
alias grbm="git-rebase-merge"
alias grbs="git rebase --skip"
alias grl="git reset --hard 'HEAD^1'"
alias grm="git rm"
alias grmc="git rm --cached"
alias grmf="git rm --force"
alias gs="git status"
alias gss="git status --short"
alias gt="git tracking"
