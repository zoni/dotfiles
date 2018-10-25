" vim: foldmethod=marker

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
let g:syntastic_rst_checkers = ['rst2pseudoxml']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': [] }
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
let g:bufExplorerSplitOutPathName=0
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

" {{{ Denite
" Denite is configured in ~/.vim/post-plug-end.vim because of dynamic
" configuration method.
" }}}

" {{{ vim-swoop
let g:swoopUseDefaultKeyMap = 0
" }}}

" {{{ vim-mix-format
let g:mix_format_on_save = 0
let g:mix_format_options = '--check-equivalent'
let g:mix_format_silent_errors = 1

" mix_format_on_save tends to throw errors when multiple buffers have been
" opened via netrw, the BufWritePre autocommand works around this.
augroup elixirau
    au!
    au BufWritePre *.ex,*.exs execute "MixFormat"
augroup END
" }}}

" {{{ ctrlsf
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_auto_close = {
    \ "normal" : 1,
    \ "compact": 1
\ }
let g:ctrlsf_auto_focus = {
    \ "at" : "start"
\ }
let g:ctrlsf_default_root = 'project+ff'
let g:ctrlsf_default_view_mode = 'compact'
" }}}

" {{{ tagbar
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_sort = 0
let g:tagbar_compact = 0

" https://github.com/majutsushi/tagbar/wiki#ansible
let g:tagbar_type_ansible = {
    \ 'ctagstype' : 'ansible',
    \ 'kinds' : [
        \ 't:tasks'
    \ ],
    \ 'sort' : 0
\ }

" https://github.com/majutsushi/tagbar/wiki#elixir
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

" https://github.com/majutsushi/tagbar/wiki#markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" https://github.com/majutsushi/tagbar/wiki#makefile-targets
let g:tagbar_type_make = {
    \ 'kinds':[
        \ 'm:macros',
        \ 't:targets'
    \ ]
\}

" https://github.com/majutsushi/tagbar/wiki#puppet
let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
      \]
\}

" https://github.com/majutsushi/tagbar/wiki#restructuredtext
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : 'rst2ctags',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
" }}}

" {{{ vim-markdown
" Use pandoc instead of default renderer
let vim_markdown_preview_pandoc=1
" }}}
