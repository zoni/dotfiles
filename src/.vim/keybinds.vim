" vim: foldmethod=marker

" {{{ General
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
nnoremap <leader><tab> <C-w>p
nnoremap <leader>w+ <C-w>+
nnoremap <leader>w- <C-w>-
nnoremap <leader>w< <C-w><
nnoremap <leader>w= <C-w>=
nnoremap <leader>w> <C-w>>
nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>L
nnoremap <leader>wP <C-w>P
nnoremap <leader>wR <C-w>R
nnoremap <leader>wc <C-w>c
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wn <C-w>n
nnoremap <leader>wo <C-w>o
nnoremap <leader>wp <C-w>p
nnoremap <leader>wq <C-w>q
nnoremap <leader>wr <C-w>r
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nnoremap <leader>wx <C-w>x
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
nnoremap <silent> <C-c> <Esc>:Bclose<CR>

nnoremap <leader>bC :bprevious\|bdelete! #<CR>
nnoremap <leader>bE :edit .<CR>
nnoremap <leader>bb :BufExplorer<CR>
nnoremap <leader>bc :Bclose<CR>
nnoremap <leader>be :Explore<CR>
nnoremap <leader>bf :FzfBuffers!<CR>
nnoremap <leader>bh :FzfHistory!<CR>
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
nnoremap <silent> <leader>to :TagbarOpen fjc<CR>
nnoremap <silent> <leader>T :TagbarToggle<CR>
" Show the YankRing
nnoremap <silent> <leader>yr :YRShow<CR>
nnoremap - :Explore<CR>

nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <Leader>ma :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <Leader>mr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
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
nnoremap <leader>rL :FzfBCommits!<CR>
nnoremap <leader>rP :Git push<Space>
nnoremap <leader>rS :Git<CR>
nnoremap <leader>rb :Git blame<CR>
nnoremap <leader>rc :Git commit<Space>
nnoremap <leader>rd :Gdiff<CR>
nnoremap <leader>rf :Git fetch<CR>
nnoremap <leader>rhs :GitGutterStageHunk<CR>
nnoremap <leader>rhu :GitGutterUndoHunk<CR>
nnoremap <leader>rl :FzfCommits!<CR>
nnoremap <leader>rm :MagitOnly<CR>
nnoremap <leader>rp :Git pull<Space>
nnoremap <leader>rr :Git<Space>
nnoremap <leader>rw :Gwrite<CR>
nnoremap [c :GitGutterPrevHunk<CR>
nnoremap ]c :GitGutterNextHunk<CR>

if has('nvim')
	nnoremap <leader>rs :tabnew<CR>:term tig status<CR>
	nnoremap <leader>rt :tabnew<CR>:term tig<CR>
else
	nnoremap <leader>rs :silent !tig status<CR>:redraw!<CR>
	nnoremap <leader>rt :silent !tig<CR>:redraw!<CR>
endif
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
nmap <leader>mp :ComposerOpen<CR>

" Fix arrow keys while searching if having SearchComplete plugin installed
cnoremap <silent> <Esc>[A <Esc>[A
cnoremap <silent> <Esc>[B <Esc>[B
" }}}

" {{{ Searching
nmap <leader>/ <Plug>CtrlSFPrompt
vmap <leader>/ <Plug>CtrlSFVwordExec
nmap <leader>* <Plug>CtrlSFCwordPath<CR>
nmap <leader># <Plug>CtrlSFCwordPath<CR>

nmap <leader>? :Swoop!<space>
vmap <leader>? :call SwoopMultiSelection()<CR>

nmap <leader>: :FzfHistory:!<CR>
nmap <leader>sf :FZF!<CR>
nmap <leader>sg :FzfRg!<space>
nmap <leader>sl :Lines!<CR>
" }}}

" {{{ Table mode
let g:table_mode_map_prefix = '<Leader>t'
" }}}
