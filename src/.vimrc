set nocompatible

call plug#begin('~/.vim-plugs')

Plug 'airblade/vim-gitgutter'
Plug 'aklt/plantuml-syntax'
Plug 'ciaranm/securemodelines'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'dkarter/bullets.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'  " note: lazy-loading caused issues with definition highlights
Plug 'fs111/pydoc.vim', { 'for': 'python' }
Plug 'godlygeek/tabular'
Plug 'jamessan/vim-gnupg'
Plug 'jamshedvesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'jlanzarotta/bufexplorer'
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'kshenoy/vim-signature'
Plug 'lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'  " note: lazy-loading this doesn't work with vim-airline
Plug 'mhinz/vim-mix-format',
Plug 'michaeljsmith/vim-indent-object'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pelodelfuego/vim-swoop',
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'reedes/vim-pencil'
Plug 'rodjek/vim-puppet'
Plug 'scrooloose/nerdcommenter'
Plug 'shougo/denite.nvim'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'slashmili/alchemist.vim'
Plug 'terryma/vim-expand-region'
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/SearchComplete'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'vim-syntastic/syntastic'

source ~/.vim/general.vim
source ~/.vim/yankring.vim
source ~/.vim/functions.vim
source ~/.vim/theme.vim
source ~/.vim/formatting.vim
source ~/.vim/quirks.vim
source ~/.vim/gui.vim
source ~/.vim/syntax.vim
source ~/.vim/plugins.vim
source ~/.vim/keybinds.vim

call plug#end()

source ~/.vim/post-plug-end.vim
