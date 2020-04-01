set nocompatible

function! BuildVimMarkdownComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.vim-plugs')

Plug 'airblade/vim-gitgutter'
Plug 'aklt/plantuml-syntax'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'make release' }
Plug 'ciaranm/securemodelines'
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dkarter/bullets.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildVimMarkdownComposer'), 'for': 'markdown' }
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'jamessan/vim-gnupg'
Plug 'jlanzarotta/bufexplorer'
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature'
Plug 'lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'  " note: lazy-loading this doesn't work with vim-airline
Plug 'mhinz/vim-mix-format',
Plug 'michaeljsmith/vim-indent-object'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pelodelfuego/vim-swoop',
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'rbgrouleff/bclose.vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-wheel'
Plug 'reedes/vim-wordy'
Plug 'rodjek/vim-puppet'
Plug 'rstacruz/vim-closer'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'shougo/denite.nvim'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'slashmili/alchemist.vim'
Plug 'terryma/vim-expand-region'
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/SearchComplete'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }

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

source /usr/share/vim/vimfiles/plugin/fzf.vim
