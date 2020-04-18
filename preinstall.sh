#!/usr/bin/env bash

set -e
set -x

mkdir -p \
	$HOME/.i3 \
	$HOME/.vimperator \
	$HOME/.local/share/applications \
	$HOME/.config/autostart \
	$HOME/.config/environment.d \
	$HOME/.config/sway \
	$HOME/.config/systemd/user \
	$HOME/.vscode

if [ -e $HOME/.config/sway ]; then
	sha256sum $HOME/.config/sway/{config,inputs,outputs} > $TMPDIR/sway.sha256sum || true
	sha256sum $HOME/.config/sway/swayidle > $TMPDIR/swayidle.sha256sum || true
fi
test -e $HOME/.config/mako/config && sha256sum $HOME/.config/mako/config > $TMPDIR/mako.sha256sum
