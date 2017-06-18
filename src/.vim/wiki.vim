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
	au BufNewFile,BufRead */.vimwiki/* setlocal shiftwidth=2 et tw=74 spell spelllang=en_us
	au BufWinEnter */.vimwiki/diary/diary.md VimwikiDiaryGenerateLinks
	au BufWinEnter */.vimwiki/diary/diary.md write
	au BufNewFile */.vimwiki/diary/*.md put! =strftime('# %A %B %d %Y')
augroup END
