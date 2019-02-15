#!/bin/sh

export TERM=xterm-256color
if [ $(which neomutt 2>/dev/null) ]; then
	exec neomutt -n
fi
exec mutt -n
