let g:ctrlp_map = '<leader>p'
let g:ctrlp_clear_cache_on_exit = 0

if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(git|hg|svn|sw[po])$',
	\ 'file': '\v\.(sw[op]|so|pyc)$',
	\ }
