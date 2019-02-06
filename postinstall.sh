#!/usr/bin/env bash

set -e
set -x

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

systemctl --user daemon-reload
