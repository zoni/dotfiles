#!/usr/bin/env bash

set -e
set -x

HOST=$(hostname)

systemctl --user daemon-reload || true

# Remove broken symlinks
for file in "$HOME"/.zsh/*; do
	test -e "$file" || rm -f "$file"
done

# Avoid shelling out to ruby on each shell startup by substituting the ruby
# call result at the time of dotfiles install.
echo 'export PATH="$PATH:'"$(ruby -e 'puts Gem.user_dir')"'/bin"' >> $HOME/.zsh/05-path.zsh

for file in $HOME/.zsh/*.zsh; do
	printf '\n# -- %s --\n\n' $file >> $HOME/.zshrc
	cat $file >> $HOME/.zshrc
done
# This will make zgenom do its thing
/usr/bin/env zsh -i -c ''

ln -snf $HOME/.vim/ $HOME/.config/nvim
ln -snf $HOME/.vimrc $HOME/.config/nvim/init.vim

if type nvim > /dev/null; then
	nvim +PlugInstall +qall
else
	vim +PlugInstall +qall
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

if [[ "$OSTYPE" != "darwin"* ]]; then
    gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"
    gsettings set org.gnome.desktop.interface font-name "DejaVu Sans Book 11"
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    gsettings set org.gnome.desktop.interface icon-theme "gnome-brave"

    test -e "$HOME/.config/sway/inputs" || cp "$(dirname $BASH_SOURCE)/src/.config/sway/inputs.example" "$HOME/.config/sway/inputs"
    test -e "$HOME/.config/sway/outputs" || cp "$(dirname $BASH_SOURCE)/src/.config/sway/outputs.example" "$HOME/.config/sway/outputs"
    test -e "$HOME/.config/sway/current-wallpaper" || ln -sf /usr/share/backgrounds/default.png "$HOME/.config/sway/current-wallpaper"
    test -e "$HOME/.i3/current-wallpaper" || ln -sf /usr/share/backgrounds/default.png "$HOME/.i3/current-wallpaper" && feh --bg-scale  "$HOME/.i3/current-wallpaper"

    sha256sum --check --status $TMPDIR/mako.sha256sum || dex $HOME/.local/share/applications/mako.desktop
    sha256sum --check --status $TMPDIR/sway.sha256sum || ( swaymsg reload ; sleep 1; alacritty-dropdown --hide; )
    sha256sum --check --status $TMPDIR/swayidle.sha256sum || dex $HOME/.local/share/applications/swayidle.desktop
    sha256sum --check --status $TMPDIR/i3.sha256sum || i3-msg reload

    systemctl --user disable knowledgebase.service || true
fi

if curl --silent --fail --output /dev/null https://github.com/; then
	cargo install --git ssh://git@github.com/zoni/knowledgebase-cli --branch main --locked
	systemctl --user enable knowledgebase-watch.service || true
	systemctl --user restart knowledgebase-watch.service || true

	cargo install obsidian-export
fi

if [[ ! -e $HOME/Bin/obsidian && "$OSTYPE" != "darwin"* ]]; then
	OBSIDIAN_APPIMAGE=$(curl --silent --location https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | jq -r '.assets[].browser_download_url | select(. | endswith(".AppImage"))' | grep -v arm64)
	curl --location $OBSIDIAN_APPIMAGE > $HOME/Bin/obsidian-appimage.bin
	chmod +x $HOME/Bin/obsidian-appimage.bin
	rm -rf $HOME/Bin/Obsidian.AppImage
	(cd $HOME/Bin && $HOME/Bin/obsidian-appimage.bin --appimage-extract)
	mv $HOME/Bin/squashfs-root $HOME/Bin/Obsidian.AppImage
	rm $HOME/Bin/obsidian-appimage.bin
	ln -sf $HOME/Bin/Obsidian.AppImage/obsidian $HOME/Bin/obsidian
fi

if [[ -e $HOME/Knowledgebase/.scripts/pyproject.toml ]]; then
	if type poetry >/dev/null; then
		(cd $HOME/Knowledgebase/.scripts/ && poetry install)
	fi
fi
