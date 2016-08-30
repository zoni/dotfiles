# These hooks will trigger a notification with notify-send when a command
# runs for more than $THRESHOLD seconds. Part of the magic for this relies
# on $SECONDS, which is described in the zsh manual as follows:
#
# SECONDS
#     The number of seconds since shell invocation. If this parameter is
#     assigned a value, then the value returned upon reference will be
#     the value that was assigned plus the number of seconds since the
#     assignment.

LONG_COMMAND_NOTIFY_THRESHOLD=30

preexec() {
	SECONDS=0
}
precmd() {
	local statuscode=$?

	# Bail out if not an X session or connected via SSH
	if [ -z "$DISPLAY" -o -n "$SSH_CLIENT" ]; then
		return 0
	fi

	# Ensures notify-send is present
	if command -v notify-send > /dev/null; then
		(( SECONDS > LONG_COMMAND_NOTIFY_THRESHOLD )) && notify-send \
			--hint=int:transient:1 --urgency=normal \
			--icon ${${statuscode/0/terminal}//<->*/error} \
			"Command finished${${statuscode/0/}//<->*/ with error}" \
			$history[$[HISTCMD-1]]
	fi
}
