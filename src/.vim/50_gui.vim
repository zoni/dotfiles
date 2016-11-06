" Set term title
set title

" have the mouse enabled all the time:
if !has('nvim')
	set ttymouse=xterm2
endif
set mouse=a

" Enable horizontal scrollbar
set guioptions+=b
