if [ -e /etc/profile.d/autojump.zsh ]; then
	source /etc/profile.d/autojump.zsh
fi

# Source all the .zsh files in $HOME/.zsh/
# Allows for conf.d style configuration of zsh
for file in $HOME/.zsh/*.zsh; do
	source $file
done
