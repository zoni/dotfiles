if [ -e /etc/profile.d/autojump.zsh ]; then
	source /etc/profile.d/autojump.zsh
fi

FORGIT_NO_ALIASES=1
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

source "${HOME}/.zgenom/zgenom.zsh"
if ! zgenom saved; then
	# zsh-syntax-highlighting must be installed before zsh-history-substring-search
	zgenom load zsh-users/zsh-syntax-highlighting
	zgenom load zsh-users/zsh-history-substring-search

	zgenom load 3v1n0/zsh-bash-completions-fallback
	zgenom load LucasLarson/gunstage
	zgenom load Tarrasch/zsh-autoenv
	zgenom load wfxr/forgit
	zgenom load zsh-vi-more/vi-increment
	zgenom load zsh-vi-more/vi-motions
	zgenom load zsh-vi-more/vi-quote

	zgenom compile .zshrc
	zgenom compile .zsh
	[ ! -z $ZDOTDIR ] && zgenom compile $ZDOTDIR

	zgenom save
fi

eval "$(starship init zsh)"

# Source all the .zsh files in $HOME/.zsh/
# Allows for conf.d style configuration of zsh
for file in $HOME/.zsh/*.zsh; do
	source "$file"
done
