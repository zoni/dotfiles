# vim: et
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

install -d /run/user/${UID}/tmp && export TMPDIR=/run/user/${UID}/tmp || true

. $HOME/.zsh/05-path.zsh
. $HOME/.zsh/50-env.zsh

if [ "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon --start --components=ssh,gpg,pkc11,secrets)
    xautolock -time 5 -locker 'gnome-screensaver-command --lock' &
    compton &
    gnome-screensaver &
    if [ -e /sys/class/power_supply/BAT0/ ]; then
        cbatticon --update-interval 10 --low-level 15 --critical-level 5 --command-critical-level "systemctl suspend --ignore-inhibitors" &
    fi
fi

udev-notify &
xrdb -merge .Xdefaults
apply-input-device-settings
