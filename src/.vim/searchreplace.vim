" Do case-insenitive searches
set ignorecase 
" Except when there are uppercase chars in search
set scs

" Do search-as-you-type
set incsearch

if executable('ag')
	set grepprg=ag\ --hidden\ --nogroup\ --nocolor
	command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif

" Search for word under cursor
nmap <leader># :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
