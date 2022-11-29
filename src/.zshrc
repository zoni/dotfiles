if [ -e /etc/profile.d/autojump.zsh ]; then
	source /etc/profile.d/autojump.zsh
fi

export FORGIT_NO_ALIASES=1
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

source "${HOME}/.zgenom/zgenom.zsh"
if ! zgenom saved; then
	zgenom load 3v1n0/zsh-bash-completions-fallback
	zgenom load LucasLarson/gunstage
	zgenom load Tarrasch/zsh-autoenv
	zgenom load wfxr/forgit
	zgenom load zsh-users/zsh-completions
	zgenom load zsh-vi-more/vi-increment
	zgenom load zsh-vi-more/vi-motions
	zgenom load zsh-vi-more/vi-quote

	zgenom compile ~/.zshrc
	[ ! -z $ZDOTDIR ] && zgenom compile $ZDOTDIR

	zgenom save
fi

# dotfiles postinstall.sh will concat all of ~/.zsh/*.zsh below this line.
