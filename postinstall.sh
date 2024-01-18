#!/usr/bin/env bash

set -e
set -x

HOST=$(hostname)

# usage: gnome-extension [enable|disable] <extension>
gnome-extension() {
    if gnome-extensions list | grep "$2"; then
        gnome-extensions "$1" "$(gnome-extensions list | grep "$2")"
    fi
}

systemctl --user daemon-reload || true
systemctl --user enable --now syncthing.service

if systemctl --user is-enabled espanso.service; then
    systemctl --user restart espanso.service
else
    systemctl --user enable --now espanso.service
fi

# Avoid shelling out to ruby on each shell startup by substituting the ruby
# call result at the time of dotfiles install.
echo 'export PATH="$PATH:'"$(ruby -e 'puts Gem.user_dir')"'/bin"' >> $HOME/.zsh/05-path.zsh

for file in "$HOME"/.zsh/*.zsh; do
    test -e "$file" || rm -f "$file"  # Remove broken symlinks
    printf '\n# -- %s --\n\n' "$file" >> "$HOME/.zshrc"
    cat "$file" >> "$HOME/.zshrc"
done
# This will make zgenom do its thing
/usr/bin/env zsh -i -c ''

patch-electron-desktop-files
flatpak override --user --socket=wayland com.discordapp.Discord || true

ln -snf $HOME/.vim/ $HOME/.config/nvim
ln -snf $HOME/.vimrc $HOME/.config/nvim/init.vim

if type nvim > /dev/null; then
    nvim +PlugInstall +qall
else
    vim +PlugInstall +qall
fi

if [ -e $HOME/.config/udev-notify/config.$HOST.toml ]; then
    cat $HOME/.config/udev-notify/config.$HOST.toml  >> $HOME/.config/udev-notify/config.toml
fi

if [[ -e /var/lib/flatpak/app/org.wezfurlong.wezterm/ ]]; then
	ln --force --symbolic "$HOME/.config/wezterm/" "$HOME/.var/app/org.wezfurlong.wezterm/config/"
	for file in /var/lib/flatpak/app/org.wezfurlong.wezterm/current/active/files/bin/*; do
		ln --force --symbolic "$file" "$HOME"/.local/bin/"$(basename "$file")"
	done
fi
tic -x -o "$HOME/.terminfo" "$HOME/.config/wezterm/wezterm.terminfo"


if type code >/dev/null; then
    # Symlink "Code - OSS" -> "Code"
    if [[ -d "$HOME/.config/Code - OSS" && ! -L "$HOME/.config/Code - OSS" ]]; then
        if [ -d "$HOME/.config/Code" ]; then
            rm -rf "$HOME/.config/Code"
        fi
        mv "$HOME/.config/Code - OSS" "$HOME/.config/Code"
        ln -sf "Code" "$HOME/.config/Code - OSS"
    fi

    # Install VS Code extensions listed in extensions.install that are missing from `code --list-extensions`
    comm -13 <(code --list-extensions|sort) <(grep -v -E '^#' $(dirname $BASH_SOURCE)/src/.vscode/extensions.install | sort) | xargs --no-run-if-empty --max-lines=1 -- code --install-extension
    # Remove VS Code extensions listed in extensions.remove that are listed in `code --list-extensions`
    comm -12 <(code --list-extensions|sort) <(grep -v -E '^#' $(dirname $BASH_SOURCE)/src/.vscode/extensions.remove | sort) | xargs --no-run-if-empty --max-lines=1 -- code --uninstall-extension

    ln --force --symbolic ../../../.vscode/settings.json "$HOME/.config/Code/User/settings.json"
    ln --force --symbolic ../../../.vscode/keybindings.json "$HOME/.config/Code/User/keybindings.json"
fi

if [[ "$OSTYPE" != "darwin"* ]]; then
    import-dconf-dumps
    systemctl --user disable knowledgebase.service || true
fi

if [[ "$DESKTOP_SESSION" == "gnome" ]]; then
    gnome-extension enable GPaste@gnome-shell-extensions.gnome.org
    gnome-extension enable appindicatorsupport@rgcjonas.gmail.com
    gnome-extension enable caffeine@patapon.info
    gnome-extension enable pop-shell@system76.com
    gnome-extension enable sound-output-device-chooser@kgshank.net

    # Buggy, messes with dynamic workspace creation
    gnome-extension disable auto-move-windows@gnome-shell-extensions.gcampax.github.com
fi

if [[ "$DESKTOP_SESSION" == "i3" ]]; then
    test -e "$HOME/.i3/current-wallpaper" || ln -sf /usr/share/backgrounds/default.png "$HOME/.i3/current-wallpaper" && feh --bg-scale  "$HOME/.i3/current-wallpaper" || true
    sha256sum --check --status $TMPDIR/i3.sha256sum || i3-msg reload
fi

if [[ "$DESKTOP_SESSION" == "sway-shell" ]]; then
    test -e "$HOME/.config/sway/inputs" || cp "$(dirname $BASH_SOURCE)/src/.config/sway/inputs.example" "$HOME/.config/sway/inputs"
    test -e "$HOME/.config/sway/outputs" || cp "$(dirname $BASH_SOURCE)/src/.config/sway/outputs.example" "$HOME/.config/sway/outputs"
    test -e "$HOME/.config/sway/current-wallpaper" || ln -sf /usr/share/backgrounds/default.png "$HOME/.config/sway/current-wallpaper"

    sha256sum --check --status $TMPDIR/mako.sha256sum || dex $HOME/.local/share/applications/mako.desktop
    sha256sum --check --status $TMPDIR/sway.sha256sum || ( swaymsg reload ; sleep 1; alacritty-dropdown --hide; )
    sha256sum --check --status $TMPDIR/swayidle.sha256sum || dex $HOME/.local/share/applications/swayidle.desktop
fi

if curl --silent --fail --output /dev/null https://github.com/; then
    cargo install --git https://github.com/zoni/knowledgebase-cli.git --branch main --locked
    systemctl --user enable knowledgebase-watch.service || true
    systemctl --user restart knowledgebase-watch.service || true

    cargo binstall -y obsidian-export

    if [[ -e "$HOME/Workspace/go/bin/pingrep" ]]; then
        rm "$HOME/Workspace/go/bin/pingrep"
        rm "$HOME/.local/share/pingrep/bookmarks.json"
    fi
    cargo binstall -y pingrep
    systemctl --user enable --now pingrep-update.timer

    cargo install --git https://github.com/zoni/lycheeweb.git --branch main --locked
fi

if [[ $USER == "zoni" ]]; then
    EMAIL_PASSWORD="$(pass show Email/nick@groenen.me | head -n 1)"
    sed -i -e "s/__PASSWORD__/${EMAIL_PASSWORD}/g" $HOME/.mutt/account
elif [[ $USER == "work" ]]; then
    gsettings set org.gnome.desktop.session idle-delay 270 || true
fi

if [[ $USER != "root" ]]; then
    echo 'source ~/.vifm/vifmrc.x' >> $HOME/.vifm/vifmrc
fi


if [[ ! -e $HOME/.local/bin/obsidian && "$OSTYPE" != "darwin"* ]]; then
    OBSIDIAN_APPIMAGE=$(curl --silent --location https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | jq -r '.assets[].browser_download_url | select(. | endswith(".AppImage"))' | grep -v arm64)
    curl --location $OBSIDIAN_APPIMAGE > $HOME/.local/bin/obsidian-appimage.bin
    chmod +x $HOME/.local/bin/obsidian-appimage.bin
    rm -rf $HOME/.local/bin/Obsidian.AppImage
    (cd $HOME/.local/bin && $HOME/.local/bin/obsidian-appimage.bin --appimage-extract)
    mv $HOME/.local/bin/squashfs-root $HOME/.local/bin/Obsidian.AppImage
    rm $HOME/.local/bin/obsidian-appimage.bin
    ln -sf $HOME/.local/bin/Obsidian.AppImage/obsidian $HOME/.local/bin/obsidian
    sed \
        -e "s:^Exec=.*:Exec=$HOME/.local/bin/obsidian %U:" \
        -e "s:^Icon=.*:Icon=$HOME/.local/bin/Obsidian.AppImage/obsidian.png:" \
        "$HOME/.local/bin/Obsidian.AppImage/obsidian.desktop" > "$HOME/.local/share/applications/obsidian.desktop"
fi

if [[ -e $HOME/Knowledgebase/.scripts/pyproject.toml ]]; then
    if type poetry >/dev/null; then
        (cd "$HOME/Knowledgebase/.scripts/" && poetry install --no-root)
    fi
fi

if [[ "$OSTYPE" != "darwin"* ]]; then
    xdg-desktop-menu forceupdate
    ln -sf keyringrc.linux.cfg "$HOME/.config/python_keyring/keyringrc.cfg"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    PIP_REQUIRE_VENV=0 pip3 install --user pynvim
fi

if type gh >/dev/null 2>&1; then
    # Extension install fails when not logged in.
    if gh auth status >/dev/null 2>&1; then
        gh extension list | grep --fixed-strings --silent dlvhdr/gh-dash || gh extension install dlvhdr/gh-dash
    fi
fi

pipx install 'maturin[patchelf]'
pipx install llm

printf "\nDone ✔\n"
