" vim: foldmethod=marker

" {{{ CtrlP
let g:ctrlp_map = '<leader>p'
let g:ctrlp_clear_cache_on_exit = 0

" Include current file in listing
let g:ctrlp_match_current_file = 1

nnoremap <silent> <leader>p :CtrlP<CR>

if executable('ag')
	let g:ctrlp_user_command = 'ag %s --hidden --files-with-matches --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

" The following settings are not used when ctrlp_user_command is set.
" ~/.agignore is used for ag.
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(git|hg|svn|sw[po])$',
	\ 'file': '\v\.(sw[op]|so|pyc)$',
	\ }
" }}}

" {{{ Gundo
let g:gundo_prefer_python3 = 1
let g:gundo_return_on_revert = 0

nmap <silent> <leader>u :GundoToggle<CR>
" }}}

" {{{ Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': [] }
" }}}

" {{{ VimWiki
let g:vimwiki_list = [{
	\ 'path': '~/Documents/.vimwiki',
	\ 'path_html': '',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'auto_toc': 1,
	\ 'auto_tags': 1,
	\ }]

" https://github.com/vimwiki/vimwiki/issues/95
let g:vimwiki_global_ext = 0

let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_folding = 'expr'
let g:vimwiki_map_prefix = '<Leader>m'

augroup wiki
	au!
	au BufNewFile,BufRead */.vimwiki/* setlocal shiftwidth=2 et tw=74 spell spelllang=en_us nowrap
	au BufWinEnter */.vimwiki/diary/diary.md VimwikiDiaryGenerateLinks
	au BufWinEnter */.vimwiki/diary/diary.md write
	au BufNewFile */.vimwiki/diary/*.md put! =strftime('# %A %B %d %Y')
augroup END
" }}}

" {{{ Golang
augroup golang
	au!
	au FileType go nmap <leader>mt <Plug>(go-test)
	au FileType go nmap <leader>mb <Plug>(go-build)
	au FileType go nmap <Leader>mc <Plug>(go-coverage-toggle)
	au FileType go nmap <Leader>mi <Plug>(go-info)
	au FileType go nmap <Leader>mr :GoRename<CR>
augroup END

let g:go_auto_type_info = 0
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" https://github.com/fatih/vim-go/issues/502 and
" https://github.com/fatih/vim-go/pull/691
let g:go_fmt_experimental = 1
" }}}

" {{{ Python
if has('python3')
	let g:pymode_python = 'python3'
endif

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<leader>mg"
let g:jedi#goto_assignments_command = "<leader>ma"
let g:jedi#goto_definitions_command = "md"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>mu"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>mr"

let g:SimpylFold_docstring_preview = 0
let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1

if has('python3')
	nmap <leader>mrb :py3 RemoveBreakpoints()<CR>
	nmap <leader>msb :py3 SetBreakpoint()<CR>
elseif has('python')
	nmap <leader>mrb :python RemoveBreakpoints()<CR>
	nmap <leader>msb :python SetBreakpoint()<CR>
endif

augroup pythonau
	au!
	au FileType python setlocal completeopt-=preview
	au BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
	au BufWinLeave *.py setlocal foldexpr< foldmethod<
augroup END
" }}}

" {{{ Bufexplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDisableDefaultKeyMapping=1
" }}}

" {{{ Netrw
let g:netrw_liststyle = 1

augroup netrwau
	au!
	au FileType netrw setlocal cursorline nolist
augroup END
" }}}

" {{{ Supertab
" Let SuperTab try to determine best completion type automatically based on
" text preceding the cursor.
let g:SuperTabDefaultCompletionType = "context"
" }}}
