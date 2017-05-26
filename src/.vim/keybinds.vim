" vim: foldmethod=marker

" {{{ General
" Map jj to Escape in insert mode. :)
inoremap jj <Esc>

" Make movement on wrapped lines go down/up to next row, rather than the
" next line in file.
nnoremap j gj
nnoremap k gk

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" Don't use Ex mode, use Q for formatting
map Q gq

xmap . <Plug>(expand_region_expand)
xmap , <Plug>(expand_region_shrink)
" }}}

" {{{ Windows
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>L
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nnoremap <leader>wn <C-w>n
nnoremap <leader>wc <C-w>c
nnoremap <leader>wq <C-w>q
nnoremap <leader>wo <C-w>o
nnoremap <leader>wp <C-w>p
nnoremap <leader><tab> <C-w>p
nnoremap <leader>wP <C-w>P
nnoremap <leader>wr <C-w>r
nnoremap <leader>wR <C-w>R
nnoremap <leader>wx <C-w>x
nnoremap <leader>w= <C-w>=
nnoremap <leader>w- <C-w>-
nnoremap <leader>w+ <C-w>+
nnoremap <leader>w< <C-w><
nnoremap <leader>w> <C-w>>
"nnoremap <leader>w_ <C-w>_
"nnoremap <leader>w| <C-w>|
" }}}

" {{{ Buffers
" YankRing overrides a few keymaps if we try to set them the usual way
function! YRRunAfterMaps()
	" Open next buffer
	nnoremap <silent> <C-n> <Esc>:bnext<CR>
	" Previous buffer
	nnoremap <silent> <C-p> <Esc>:bprevious<CR>
endfunction
" Close buffer
"nmap <silent> <C-c> <Esc>:bdelete<CR>
nnoremap <silent> <C-c> <Esc>:bprevious\|bdelete #<CR>

nnoremap <leader>bb :BufExplorer<CR>
nnoremap <leader>bc :bprevious\|bdelete #<CR>
nnoremap <leader>bC :bprevious\|bdelete! #<CR>
nnoremap <leader>bE :edit .<CR>
nnoremap <leader>be :Explore<CR>
nnoremap <leader>bla :set norelativenumber<CR>
nnoremap <leader>blr :set relativenumber<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bs :split<CR>:BufExplorer<CR>
nnoremap <leader>bv :vsplit<CR>:BufExplorer<CR>
nnoremap <leader>bw :w<CR>
" }}}

" {{{ Plugin toggles
" Toggle taglist
nmap <silent> <leader>t :TagbarToggle<CR>
" Show the YankRing
nmap <silent> <leader>yr :YRShow<CR>
" }}}

" {{{ Folding
nnoremap <leader>fm :set foldmethod=marker<CR>
nnoremap <leader>fM :set foldmethod=manual<CR>
nnoremap <leader>fi :set foldmethod=indent<CR>
nnoremap <leader>fe :set foldmethod=expr<CR>
nnoremap <leader>fs :set foldmethod=syntax<CR>
nnoremap <leader>fd :set foldmethod=diff<CR>
" }}}

" {{{ Git
nnoremap <expr> <leader>rg ":Ggrep! " . input("Git grep: ") . "<CR>:copen<CR>"
nnoremap <leader>rL :Glog! --<CR>:copen<CR>
nnoremap <leader>rP :Gpush<Space>
nnoremap <leader>rS :Gstatus<CR>
nnoremap <leader>rb :Gblame<CR>
nnoremap <leader>rc :Gcommit<Space>
nnoremap <leader>rd :Gdiff<CR>
nnoremap <leader>rf :Gfetch<CR>
nnoremap <leader>rl :silent !tig %<CR>:redraw!<CR>
nnoremap <leader>rp :Gpull<Space>
nnoremap <leader>rr :Git<Space>
nnoremap <leader>rs :silent !tig status<CR>:redraw!<CR>
nnoremap <leader>rt :silent !tig<CR>:redraw!<CR>
nnoremap <leader>rw :Gwrite<CR>
" }}}

" {{{ Misc
" Try to write file using sudo when using double !
cmap w!! w !sudo tee % >/dev/null

" Un-highlight search matches on Ctrl+h
nmap <silent> <C-h> <Esc>:noh<CR>

" Toggle paste/nopaste
set pastetoggle=<F12>

" Open URL under cursor.
" Sleep + extra CR's ensures we don't (in most cases) see command output
" drawing over the screen as the browser is spawned.
map <Leader>w :call OpenURL()<CR>

" vim-easymotion bindings
map s <Plug>(easymotion-prefix)
map ss <Plug>(easymotion-bd-w)

" Markdown preview
let vim_markdown_preview_hotkey='<leader>mp'

" Fix arrow keys while searching if having SearchComplete plugin installed
cnoremap <silent> <Esc>[A <Esc>[A
cnoremap <silent> <Esc>[B <Esc>[B
" }}}
