if [ -e /etc/profile.d/autojump.zsh ]; then
	source /etc/profile.d/autojump.zsh
fi

source "${HOME}/.zgenom/zgenom.zsh"
if ! zgenom saved; then
	# This plugin interferes with history-substring-search if not loaded first
	zgenom load zsh-users/zsh-syntax-highlighting

	zgenom ohmyzsh
	zgenom ohmyzsh plugins/bundler
	zgenom ohmyzsh plugins/command-not-found
	zgenom ohmyzsh plugins/gem
	zgenom ohmyzsh plugins/git-extras
	zgenom ohmyzsh plugins/github
	zgenom ohmyzsh plugins/history-substring-search
	zgenom ohmyzsh plugins/pip
	zgenom ohmyzsh plugins/python
	zgenom ohmyzsh plugins/rsync
	zgenom ohmyzsh plugins/vagrant

	zgenom load Tarrasch/zsh-autoenv
	zgenom load zsh-vi-more/vi-increment
	zgenom load zsh-vi-more/vi-motions
	zgenom load zsh-vi-more/vi-quote
	zgenom load LucasLarson/gunstage

	zgenom compile .zshrc
	zgenom compile ~/.zsh
	zgenom compile $ZDOTDIR

	if [ -d /usr/share/virtualenvwrapper/ -o -e /usr/bin/virtualenvwrapper.sh ]; then
		zgenom ohmyzsh plugins/virtualenvwrapper
	fi

	zgenom save
fi

# Source all the .zsh files in $HOME/.zsh/
# Allows for conf.d style configuration of zsh
for file in $HOME/.zsh/*.zsh; do
	source $file
done
