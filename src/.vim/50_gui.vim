" Set term title
set title

" have the mouse enabled all the time:
if !has('nvim')
	set ttymouse=xterm2
endif
set mouse=a

" Enable horizontal scrollbar
set guioptions+=b

" Switch syntax highlighting on when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
