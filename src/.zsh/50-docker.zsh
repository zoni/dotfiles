dshell() {
	if [ $# -ne 1 ]
	then
		echo "Usage: dshell <container-name>"
	else
		docker exec --interactive --tty $1 /bin/sh -c "TERM=$TERM exec /bin/bash --login"
	fi
}
