#!/usr/bin/env bash

set -e
set -x

HOST=$(hostname)

git config --global diff.tool meld
git config --global merge.tool meld
git config --global merge.conflictstyle diff3
git config --global commit.gpgsign true
if [[ $USER == "work" ]]; then
	git config --global user.signingkey E1B292AF00FB1524D5B7292E93EC881C83165FCE
else
	git config --global user.signingkey 4F0AD019928AE098
fi

if [[ $USER == "zoni" ]]; then
	EMAIL_PASSWORD="$(pass show Email/nick@groenen.me | head -n 1)"
	sed -i -e "s/__PASSWORD__/${EMAIL_PASSWORD}/g" $HOME/.mutt/account
fi

if [[ $USER != "root" ]]; then
	echo 'source ~/.vifm/vifmrc.x' >> $HOME/.vifm/vifmrc
fi

if [ -e $HOME/.config/udev-notify/config.$HOST.toml ]; then
	cat $HOME/.config/udev-notify/config.$HOST.toml  >> $HOME/.config/udev-notify/config.toml
fi

systemctl --user daemon-reload

if type code >/dev/null; then
	# Install VS Code extensions listed in extensions.list that are missing from `code --list-extensions`
	comm -13 <(code --list-extensions|sort) <(grep -v -E '^#' $(dirname $BASH_SOURCE)/src/.vscode/extensions.list | sort) | xargs --no-run-if-empty --max-lines=1 -- code --install-extension

	ln --force --symbolic ../../../.vscode/settings.json "$HOME/.config/Code - OSS/User/settings.json"
fi

gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"
gsettings set org.gnome.desktop.interface font-name "Ubuntu Regular 11"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
gsettings set org.gnome.desktop.interface icon-theme "gnome-brave"
