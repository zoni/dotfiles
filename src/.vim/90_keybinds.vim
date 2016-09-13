" Map jj to Escape in insert mode. :)
inoremap jj <Esc>

" Make movement on wrapped lines go down/up to next row, rather than the
" next line in file.
nnoremap j gj
nnoremap k gk

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" Try to write file using sudo when using double !
cmap w!! w !sudo tee % >/dev/null

" Un-highlight search matches on Ctrl+h
nmap <silent> <C-h> <Esc>:noh<CR>

" Toggle paste/nopaste
set pastetoggle=<F12>

"" Open new tab on Ctrl+t
"nmap <silent> <C-t> <Esc>:tabnew<CR>
"" close tab on Ctrl+w
"nmap <silent> <C-w> <Esc>:tabclose<CR>
"" next tab on Ctrl+n
"nmap <silent> <C-n> <Esc>:tabnext<CR>
"" previous tab on Ctrl+p
"nmap <silent> <C-p> <Esc>:tabprevious<CR>

" YankRing overrides a few keymaps if we try to set them the usual way
function! YRRunAfterMaps()
	" Open next buffer
	nmap <silent> <C-n> <Esc>:bnext<CR>
	" Previous buffer
	nmap <silent> <C-p> <Esc>:bprevious<CR>
endfunction
" Close buffer
nmap <silent> <C-c> <Esc>:bwipeout<CR>

" Toggle NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>
" Toggle taglist
nmap <silent> <leader>t :TagbarToggle<CR>
" Show the YankRing
nmap <silent> <leader>yr :YRShow<CR>

" Set and clear Python breakpoints (requires python.vim)
nmap <leader>cbp :py3 RemoveBreakpoints()<CR>
nmap <leader>bp :py3 SetBreakpoint()<CR>

" Open URL under cursor.
" Sleep + extra CR's ensures we don't (in most cases) see command output
" drawing over the screen as the browser is spawned.
map <Leader>w :call OpenURL()<CR>
