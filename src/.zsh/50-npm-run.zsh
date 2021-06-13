# Based upon https://github.com/akoenig/npm-run.plugin.zsh
function _npm_run_autocomplete () {
	compls=$([[ -s $PWD/package.json ]] || return 0 && jq -r '.scripts | keys | sort | .[]' package.json)
	completions=(${=compls})
	compadd -- $completions
}

compdef _npm_run_autocomplete npm run
