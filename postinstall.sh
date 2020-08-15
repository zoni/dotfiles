#!/usr/bin/env bash

set -e
set -x

HOST=$(hostname)

# A lot of remote hosts ship outdated terminfo databases which don't know about alacritty.
#
# The TERM environment variable is special to SSH and cannot be adjusted with
# SetEnv in ssh_config so set a different TERM value before calling ssh.
echo 'alias ssh="env TERM=xterm-256color ssh"' >> $HOME/.zsh/50-aliases.zsh

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

if type code >/dev/null; then
	# Install VS Code extensions listed in extensions.list that are missing from `code --list-extensions`
	comm -13 <(code --list-extensions|sort) <(grep -v -E '^#' $(dirname $BASH_SOURCE)/src/.vscode/extensions.list | sort) | xargs --no-run-if-empty --max-lines=1 -- code --install-extension

	ln --force --symbolic ../../../.vscode/settings.json "$HOME/.config/Code - OSS/User/settings.json"
fi

gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"
gsettings set org.gnome.desktop.interface font-name "DejaVu Sans Book 11"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
gsettings set org.gnome.desktop.interface icon-theme "gnome-brave"

test -e "$HOME/.config/sway/inputs" || cp "$(dirname $BASH_SOURCE)/src/.config/sway/inputs.example" "$HOME/.config/sway/inputs"
test -e "$HOME/.config/sway/outputs" || cp "$(dirname $BASH_SOURCE)/src/.config/sway/outputs.example" "$HOME/.config/sway/outputs"
test -e "$HOME/.config/sway/current-wallpaper" || ln -sf /usr/share/backgrounds/default.png "$HOME/.config/sway/current-wallpaper"
test -e "$HOME/.i3/current-wallpaper" || ln -sf /usr/share/backgrounds/default.png "$HOME/.i3/current-wallpaper" && feh --bg-scale  "$HOME/.i3/current-wallpaper"

sha256sum --check --status $TMPDIR/mako.sha256sum || dex $HOME/.local/share/applications/mako.desktop
sha256sum --check --status $TMPDIR/sway.sha256sum || ( swaymsg reload ; sleep 1; alacritty-dropdown --hide; todoist-toggle --hide )
sha256sum --check --status $TMPDIR/swayidle.sha256sum || dex $HOME/.local/share/applications/swayidle.desktop
sha256sum --check --status $TMPDIR/i3.sha256sum || i3-msg reload

systemctl --user disable knowledgebase.service || true
systemctl --user disable tiddlywiki.service || true
systemctl --user daemon-reload
