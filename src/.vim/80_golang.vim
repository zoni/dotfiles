augroup golang
	au!
	au FileType go nmap <leader>gt <Plug>(go-test)
	au FileType go nmap <leader>gb <Plug>(go-build)
	au FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
	au FileType go nmap <Leader>gi <Plug>(go-info)
	au FileType go nmap <Leader>gr :GoRename<CR>
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
