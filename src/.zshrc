if [ -e /etc/profile.d/autojump.zsh ]; then
	source /etc/profile.d/autojump.zsh
fi

FORGIT_NO_ALIASES=1
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

source "${HOME}/.zgenom/zgenom.zsh"
if ! zgenom saved; then
	cat ~/.zsh/*.zsh > ~/.zshrc.include

	zgenom load 3v1n0/zsh-bash-completions-fallback
	zgenom load LucasLarson/gunstage
	zgenom load Tarrasch/zsh-autoenv
	zgenom load wfxr/forgit
	zgenom load zsh-users/zsh-completions
	zgenom load zsh-vi-more/vi-increment
	zgenom load zsh-vi-more/vi-motions
	zgenom load zsh-vi-more/vi-quote

	zgenom compile ~/.zshrc
	zgenom compile ~/.zshrc.include
	[ ! -z $ZDOTDIR ] && zgenom compile $ZDOTDIR

	zgenom save
fi

eval "$(starship init zsh)"
source ~/.zshrc.include

# zsh-syntax-highlighting must be run before zsh-history-substring-search.
# Furthermore, it must be loaded last, as explained on
# https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
zgenom load zsh-users/zsh-syntax-highlighting
zgenom load zsh-users/zsh-history-substring-search
