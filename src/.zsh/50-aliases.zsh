alias tree="tree -C -L 2"
alias t="tree"
function treeless() {
	tree $@ | less
}
alias tl="treeless"

if type exa > /dev/null; then
	alias l="exa -g"
	alias la="exa -ag"
	alias ll="exa -lg"
	alias lla="exa -lag"
else
	alias l="ls -h"
	alias la="ls -hA"
	alias ll="ls -hl"
	alias lla="ls -hlA"
fi

if type nvim > /dev/null; then
	alias vim="nvim"
	alias view="nvim -R"
fi

if type knowledgebase > /dev/null; then
	function knowledgebase_binary() {
		# Helper function to determines the real knowledgebase binary path,
		# used to avoid endless self-recursion because we're redefining
		# "knowledgebase" as a function (and aliasing kbX to it).
		#
		# Calling /bin/which avoids shell built-ins otherwise we'd still get
		# the function alias here.
		if [[ -e /bin/which ]]; then
			# Linux
			/bin/which knowledgebase
		else
			# Mac OSX
			/usr/bin/which knowledgebase
		fi
	}
	function knowledgebase_sitemap_select() {
		URL="$($(knowledgebase_binary) sitemap "$@" | rofi -dmenu -no-custom -i)"
		if [[ $? -ne 0 ]]; then; return; fi

		if [[ -v WAYLAND_DISPLAY ]]; then
			printf "$URL" | wl-copy
		else
			printf "$URL" | xclip -selection clipboard
		fi
		notify-send "URL copied to clipboard" "$URL"
	}
	function knowledgebase() {
		if [ "$#" -lt 1 ]; then
			cd "$HOME/Knowledgebase"
			git status --short
		elif [[ "$1" == "sitemap-select" ]]; then
			shift
			knowledgebase_sitemap_select "$@"
		else
			$(knowledgebase_binary) "$@"
		fi
	}
	alias kb=knowledgebase
	alias kbc="knowledgebase commit"
	alias kbd="knowledgebase diff"
	alias kbj="knowledgebase journal"
	alias kbn="knowledgebase new"
	alias kbs="knowledgebase sync"
fi

function onchange() {
	while true; do inotifywait -qq -r . -e modify -e create -e moved_to -e delete --exclude '/(\.git|target/rls)/'; eval "$@"; done
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

function remark-lint() {
	if [ "$1" = "--pull" ]; then
		docker pull quay.io/zoni/remark-lint
		shift
	fi
	docker run --rm -it -v "$(pwd):/project:ro" quay.io/zoni/remark-lint /project --frail "$@"
}

# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
	f=$(mktemp)
	(
		set +e
		broot --outcmd "$f" "$@"
		code=$?
		if [ "$code" != 0 ]; then
			rm -f "$f"
			exit "$code"
		fi
	)
	code=$?
	if [ "$code" != 0 ]; then
		return "$code"
	fi
	d=$(<"$f")
	rm -f "$f"
	eval "$d"
}

case $(uname -s) in
	Linux)
		alias ls="ls --color=auto"
		;;
	FreeBSD)
		alias ls="ls -G -I"
		;;
esac

if type rich > /dev/null; then
	alias mdcat="rich --markdown --max-width 88"
	function mdless {
		rich --markdown --max-width 88 --force-terminal "$@" | less --RAW-CONTROL-CHARS
	}

	alias rstcat="rich --rst --max-width 88"
	function rstless {
		rich --rst --max-width 88 --force-terminal "$@" | less --RAW-CONTROL-CHARS
	}
fi

alias p="pushd"
alias P="popd"
alias d='dirs -v | head -10'

alias dotfiles.sh="dotfiles.sh --dotfiles-dir ~/.dotfiles"
alias gdiff="git diff --color=auto --no-ext-diff --no-index"
alias gpg="gpg --keyid-format long"
alias histgrep="history 0 | grep"
alias kc="kubectl"
alias notify-on-complete='notify-send --urgency=normal --icon ${${?/0/terminal}//<->*/error} "Command finished${${?/0/}//<->*/ with error}" ${history[$HISTCMD]%[;&|]*}'
alias print-color-table='for i in {0..255} ; do printf "\x1b[38;5;${i}mcolor${i}\n" ; done | column'
alias psgrep="ps aux | grep"
alias rg="rg --follow"
alias stream2chromecast="stream2chromecast -port 32872"
alias tf="terraform"
alias tg="terragrunt"
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

# A lot of remote hosts ship outdated terminfo databases which don't know about alacritty.
#
# The TERM environment variable is special to SSH and cannot be adjusted with
# SetEnv in ssh_config so set a different TERM value before calling ssh.
alias ssh="env TERM=xterm-256color ssh"

if type hub > /dev/null; then
	alias git="hub"
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
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
alias gcpn="git cherry-pick --no-commit"
alias gcpq="git cherry-pick --quit"
alias gcps="git cherry-pick --skip"
alias gd="forgit::diff"
alias gds="forgit::diff --staged"
alias gf="git fetch"
alias gfetch="git fetch"
alias gg="git grep"
alias gl="git compactlog"
alias gm="git merge"
alias gmff="git merge --ff-only"
alias gmnoff="git merge --no-ff"
alias gn="git new"
alias gp="git pull"
alias gpr="git pull --rebase --autostash"
alias gprune="git remote | xargs git remote prune"
alias gpull="git pull"
alias gpush="git push"
alias gr="git reset"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="forgit::rebase"
alias grbm="git-rebase-merge"
alias grbq="git rebase --quit"
alias grbs="git rebase --skip"
alias grl="git reset --hard 'HEAD^1'"
alias grm="git rm"
alias grmc="git rm --cached"
alias grmf="git rm --force"
alias gs="git status"
alias gsb="forgit::checkout::branch"
alias gss="git status --short"
alias gstash="forgit::stash::show"
alias gt="git tracking"
alias gu="gpr && gprune && git trim --no-update --delete merged-local"

alias tigr="tig refs"
alias tigs="tig status"
