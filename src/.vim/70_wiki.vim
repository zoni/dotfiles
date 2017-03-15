let g:vimwiki_list = [{
	\ 'path': '~/Documents/.vimwiki',
	\ 'path_html': '',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'auto_toc': 1,
	\ 'auto_tags': 1,
	\ }]

let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=2

augroup wiki
	au!
	au BufNewFile,BufRead */.vimwiki/* setlocal shiftwidth=2 et tw=74 spell spelllang=en_us
augroup END
