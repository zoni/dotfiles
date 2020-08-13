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

# From here on, we don't care about non-zero exit codes because
# not all of these files may exist, but that's fine and will only
# cause harmless errors later on.
set +e

sha256sum $HOME/.i3/config > $TMPDIR/i3.sha256sum
sha256sum $HOME/.config/sway/{config,inputs,outputs} > $TMPDIR/sway.sha256sum
sha256sum $HOME/.config/sway/swayidle > $TMPDIR/swayidle.sha256sum
sha256sum $HOME/.config/mako/config > $TMPDIR/mako.sha256sum

true
