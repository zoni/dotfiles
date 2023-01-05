#!/usr/bin/env bash

set -e
set -x

# Assign the directory in which this script is located to $SOURCEDIR
# https://stackoverflow.com/a/246128
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SOURCEDIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

# Make sure all directories from src/.config/ are created before
# dotfiles.sh touches them (otherwise they become symlinks to patched-src
test -e "$HOME/.config" || mkdir "$HOME/.config"
for file in "$SOURCEDIR"/src/.config/*; do
	if [[ ! -d "$file" ]]; then
		continue
	fi

	target="$HOME/.config/$(basename "$file")"
	if [[ -L "$target" ]]; then
		# Linked target, probably to patched-src. Delete it so we
		# can recreate it as a directory instead.
		rm "$target"
	fi
	test -e "$target" || mkdir "$target"
done

mkdir -p \
	"$HOME"/.gnupg \
	"$HOME"/.i3 \
	"$HOME"/.local/bin \
	"$HOME"/.local/share \
	"$HOME"/.local/share/applications \
	"$HOME"/.ssh/master \
	"$HOME"/.vifm \
	"$HOME"/.vimperator \
	"$HOME"/.vscode \
	"$HOME"/.zsh \
	"$HOME"/.{vim,vimswap,vimbackup}

test -e "${HOME}/.zgenom" || git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
/usr/bin/env zsh -i -c "zgenom reset" || true

if [[ -e "$HOME/Bin" ]]; then
	mv "$HOME"/Bin/* "$HOME/.local/bin/"
	rmdir "$HOME/Bin"
fi

# From here on, we don't care about non-zero exit codes because
# not all of these files may exist, but that's fine and will only
# cause harmless errors later on.
set +e

sha256sum "$HOME"/.i3/config > "$TMPDIR"/i3.sha256sum
sha256sum "$HOME"/.config/sway/{config,inputs,outputs} > "$TMPDIR"/sway.sha256sum
sha256sum "$HOME"/.config/sway/swayidle > "$TMPDIR"/swayidle.sha256sum
sha256sum "$HOME"/.config/mako/config > "$TMPDIR"/mako.sha256sum

true
