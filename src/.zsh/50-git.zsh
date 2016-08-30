func git_merge_gh_pr() {
	if [[ $# -lt 1 ]]
	then
		echo "Usage: git_merge_gh_pr <branch> [git-rebase-merge args]" 1>&2
		return 1
	fi
	TARGET="$1"
	shift

	git fetch
	git rebase origin/$TARGET || return 1
	git push --force || return 1
	git-rebase-merge $* $TARGET || return 1
}

alias gs="git status"
alias gss="git status --short"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git compactlog"
alias gc="git commit"
alias gca="git commit --amend"
alias gpush="git push"
alias gf="git fetch"
alias gfetch="git fetch"
alias grb="git rebase"
alias grbi="git rebase --interactive"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
alias grbs="git rebase --skip"
alias gfrb="git fetch && git rebase"
alias grbm="git-rebase-merge"
alias gn="git new"
alias ga="git ahead"
alias gb="git behind"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcoB="git checkout -B"
alias gbr="git branch"
alias gbrd="git branch -d"
alias gbrD="git branch -D"
alias grm="git rm"
alias grl="git reset --hard 'HEAD^1'"
alias gadd="git add"
alias gp="git pull --recurse-submodules"
alias gpull="git pull --recurse-submodules"
alias gpr="git pull --rebase --recurse-submodules"
alias gu='gpr && for remote in $(git remote); do git remote prune $remote; done'
alias gt="git tracking"
alias gm="git merge"
alias gmff="git merge --ff-only"
alias gmnoff="git merge --no-ff"
alias gmghpr="git_merge_gh_pr"
alias gmpr="git_merge_gh_pr master --update --delete"
alias gg="git grep"
alias grbpr="git fetch && git rebase origin/master"
alias grbprP="grbpr && git push --force"
