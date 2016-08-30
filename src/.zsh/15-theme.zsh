if [ "$USER" = "root" ]; then
	local user="%{$fg[red]%}%n@%m%{$reset_color%}"
	local prompt_symbol="#"
else
	local user="%{$fg[green]%}%n@%m%{$reset_color%}"
	local prompt_symbol="$"
fi

local dir="%{$fg[blue]%}%~%{$reset_color%}"
local return_code="%(?..%{$fg[red]%} [↵ %?]%{$reset_color%})"
local git_info='$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"

PROMPT="${user} ${dir}${git_info}${return_code} ${prompt_symbol} "
RPROMPT=""
