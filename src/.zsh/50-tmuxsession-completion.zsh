function __tmux-sessions() {
	local expl
	local -a sessions
	# grouped attached sessions are the "viewer" sessions of detached
	# named sessions, hence filtering these away
	sessions=( ${${(f)"$(command tmux list-sessions | grep --invert-match '(group .*) (attached)')"}/:[ $'\t']##/:} )
	_describe -t sessions 'sessions' sessions "$@"
}
compdef __tmux-sessions tmuxsession
