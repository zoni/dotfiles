#!/usr/bin/env bash

set -e
set -x

ln -snf $HOME/.vim/ $HOME/.config/nvim
ln -snf $HOME/.vimrc $HOME/.config/nvim/init.vim

if type nvim > /dev/null; then
	nvim +PlugInstall +qall
else
	vim +PlugInstall +qall
fi

for file in "$HOME"/.zsh/*; do
	# Remove broken symlinks
	test -e "$file" || rm -f "$file"
done

# Avoid shelling out to ruby on each shell startup by substituting the ruby
# call result at the time of dotfiles install.
echo 'export PATH="$PATH:'"$(ruby -e 'puts Gem.user_dir')"'/bin"' >> $HOME/.zsh/05-path.zsh
