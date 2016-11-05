set nocompatible

call plug#begin('~/.vim-plugs')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree',  { 'on':  'NERDTreeToggle' }
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'  " note: lazy-loading this doesn't work with vim-airline
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'fs111/pydoc.vim', { 'for': 'python' }
Plug 'vim-scripts/YankRing.vim'
Plug 'fatih/vim-go'  " note: lazy-loading caused issues with definition highlights
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/SearchComplete'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'ciaranm/securemodelines'

source ~/.vim/10_general.vim
source ~/.vim/11_yankring.vim
source ~/.vim/20_theme.vim
source ~/.vim/30_formatting.vim
source ~/.vim/40_quirks.vim
source ~/.vim/50_gui.vim
source ~/.vim/60_syntax.vim
source ~/.vim/70_ctrlp.vim
source ~/.vim/70_searchreplace.vim
source ~/.vim/70_gundo.vim
source ~/.vim/80_python.vim
source ~/.vim/80_golang.vim
source ~/.vim/85_functions.vim
source ~/.vim/90_keybinds.vim

call plug#end()
