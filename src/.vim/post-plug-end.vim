" {{{ Denite
" Avoid function errors on first run when plugin isn't installed yet.
if !empty(glob("~/.vim-plugs/denite.nvim"))
	if executable('ag')
		call denite#custom#var('file_rec', 'command', ['ag', '--hidden', '--files-with-matches', '--nocolor', '--nogroup', '-g', ''])
	endif

	call denite#custom#alias('source', 'file_rec/git', 'file_rec')
	call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '--cached', '--others', '--exclude-standard'])

	call denite#custom#map(
		\ 'insert',
		\ '<C-j>',
		\ '<denite:move_to_next_line>',
		\ 'noremap'
	\)
	call denite#custom#map(
		\ 'insert',
		\ '<C-k>',
		\ '<denite:move_to_previous_line>',
		\ 'noremap'
	\)

	call denite#custom#option('_', {
		\ 'highlight_mode_normal': 'Search',
		\ 'highlight_mode_insert': 'Search'
	\ })
end
" }}}
