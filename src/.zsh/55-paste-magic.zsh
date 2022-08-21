# https://forum.endeavouros.com/t/tip-better-url-pasting-in-zsh/6962

autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
