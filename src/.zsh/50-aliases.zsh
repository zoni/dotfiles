autoload -U zmv

alias -g C="| wc"
alias -g CB="| wc -c"
alias -g CC="2>&1 | wc"
alias -g CCB="2>&1 | wc -c"
alias -g CCL="2>&1 | wc -l"
alias -g CCW="2>&1 | wc -w"
alias -g CL="| wc -l"
alias -g CW="| wc -w"
alias -g G='| rg'
alias -g GG='2>&1 | rg'
alias -g H='| head'
alias -g HH='2>&1 | head'
alias -g J="| jq ."
alias -g JL="| jq --color-output . | less --RAW-CONTROL-CHARS"
alias -g L="| less --RAW-CONTROL-CHARS"
alias -g LL="2>&1 | less --RAW-CONTROL-CHARS"
alias -g NE="2> /dev/null"
alias -g NO="> /dev/null 2>&1"
alias -g S="| sort"
alias -g SN="| sort -n"
alias -g SNR="| sort -r -n"
alias -g SR="| sort -r"
alias -g SS="2>&1 | sort"
alias -g SSN="2>&1 | sort -n"
alias -g SSNR="2>&1 | sort -n -r"
alias -g SSR="2>&1 | sort -r"
alias -g T='| tail'
alias -g TT='2>&1 | tail'
alias -g X="| xargs"
alias -g XX="2>&1 | xargs"

alias -s py=python

alias tree="tree -C -L 2"
alias t="tree"
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

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias p="pushd"
alias P="popd"
alias d='dirs -v | head -10'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

alias code="code --unity-launch --ozone-platform=wayland --enable-features=UseOzonePlatform --enable-features=WaylandWindowDecorations --enable-features=WebRTCPipeWireCapturer"
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

if type yay > /dev/null; then
	alias yay="env LESS='cSRX' yay"
	alias yayr="yay --repo"
	alias yaya="yay --aur"
fi

if type fwupdmgr > /dev/null; then
	alias update-system-firmware="fwupdmgr get-updates && fwupdmgr upgrade"
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
alias sshts="env TERM=xterm-256color sshts"

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

alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"
