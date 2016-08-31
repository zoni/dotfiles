set nocompatible

call plug#begin('~/.vim-plugs')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'fs111/pydoc.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ctrlspace/vim-ctrlspace'

source ~/.vim/10_general.vim
source ~/.vim/11_yankring.vim
source ~/.vim/20_theme.vim
source ~/.vim/30_formatting.vim
source ~/.vim/40_quirks.vim
source ~/.vim/50_gui.vim
source ~/.vim/60_syntax.vim
source ~/.vim/70_ctrlspace.vim
source ~/.vim/70_searchreplace.vim
source ~/.vim/80_python.vim
source ~/.vim/80_golang.vim
source ~/.vim/85_functions.vim
source ~/.vim/90_keybinds.vim

call plug#end()
