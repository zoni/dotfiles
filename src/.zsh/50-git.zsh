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
alias gfrb="git fetch && git rebase"
alias gg="git grep"
alias gl="git compactlog"
alias gm="git merge"
alias gmff="git merge --ff-only"
alias gmghpr="git_merge_gh_pr"
alias gmnoff="git merge --no-ff"
alias gmpr="git_merge_gh_pr master --update --delete"
alias gn="git new"
alias gp="git pull --recurse-submodules"
alias gpr="git pull --rebase --recurse-submodules"
alias gpull="git pull --recurse-submodules"
alias gpush="git push"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase --interactive"
alias grbm="git-rebase-merge"
alias grbpr="git fetch && git rebase origin/master"
alias grbprP="grbpr && git push --force"
alias grbs="git rebase --skip"
alias grl="git reset --hard 'HEAD^1'"
alias grm="git rm"
alias grmc="git rm --cached"
alias grmf="git rm --force"
alias gs="git status"
alias gss="git status --short"
alias gt="git tracking"
alias gu='gpr && for remote in $(git remote); do git remote prune $remote; done'
