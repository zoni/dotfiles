#!/bin/bash

set -e
set -x

vim +PlugInstall +qall
ln --symbolic --no-dereference --force $HOME/.vim/ $HOME/.config/nvim
ln --symbolic --no-dereference --force $HOME/.vimrc $HOME/.config/nvim/init.vim
