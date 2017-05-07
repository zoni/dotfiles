#!/usr/bin/env bash

set -e
set -x

vim +PlugInstall +qall
ln -snf $HOME/.vim/ $HOME/.config/nvim
ln -snf $HOME/.vimrc $HOME/.config/nvim/init.vim
