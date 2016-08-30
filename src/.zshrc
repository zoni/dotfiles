# Source all the .zsh files in $HOME/.zsh/
# Allows for conf.d style configuration of zsh
for file in $HOME/.zsh/*.zsh; do
	source $file
done
