function treeless() {
	tree $@ | less
}

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

# Taken from https://github.com/addyosmani/dotfiles/blob/5625d596153aaf16d0089dd8d2a352024a8c90fa/.functions#L1-L17
function calc() {
        local result=""
        result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')"
        #                       └─ default (when `--mathlib` is used) is 20
        #
        if [[ "$result" == *.* ]]; then
                # improve the output for decimal numbers
                printf "$result" |
                sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
                    -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
                    -e 's/0*$//;s/\.$//'   # remove trailing zeros
        else
                printf "$result"
        fi
        printf "\n"
}

# Load a tmuxp profile, prompting selection with fzf if no profile name is
# provided.
function tsp() {
	local profile=""
	case $# in
		0)
			profiles="$(tmuxp ls --json 2>/dev/null)"
			if [[ $? -ne 0 ]]; then
				# Backwards compatibility for older tmuxp versions that don't
				# have the --json flag yet.
				profiles="$(tmuxp ls)"
			else
				profiles="$(printf "$profiles" | jq -r '.workspaces[].name')"
			fi
			profile="$(printf "$profiles" | fzf)"
			;;
		1)
			profile="$1"
			;;
		*)
			echo 'Usage: tsp [sessionname]'
			return 1
			;;
	esac
	if [[ "$profile" != "" ]]; then
		tmuxp load --yes "$profile"
	fi
}
