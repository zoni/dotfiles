set nocompatible

call plug#begin('~/.vim-plugs')

Plug 'ciaranm/securemodelines'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'  " note: lazy-loading caused issues with definition highlights
Plug 'fs111/pydoc.vim', { 'for': 'python' }
Plug 'godlygeek/tabular'
Plug 'jamessan/vim-gnupg'
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'kshenoy/vim-signature'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'  " note: lazy-loading this doesn't work with vim-airline
Plug 'michaeljsmith/vim-indent-object'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'reedes/vim-pencil'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree',  { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'vim-scripts/SearchComplete'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-syntastic/syntastic'

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
source ~/.vim/70_syntastic.vim
source ~/.vim/70_wiki.vim
source ~/.vim/80_python.vim
source ~/.vim/80_golang.vim
source ~/.vim/85_functions.vim
source ~/.vim/90_keybinds.vim

call plug#end()
