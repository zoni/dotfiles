let g:yankring_max_history = 250        " Number of elements to store in the history
let g:yankring_min_element_length = 1
let g:yankring_max_display = 74         " Limit items in YankRing menu to this many characters
let g:yankring_persist = 1              " Persist across sessions
let g:yankring_share_between_instances = 1 " Share across multiple instances
let g:yankring_window_autoclose = 1     " Autoclose window after selecting something
let g:yankring_window_height = 25       " Height of the YankRing window
let g:yankring_manage_numbered_reg = 1  " Let YR manage number registers as well (1p, 2p, 3p, etc)
let g:yankring_history_dir = $HOME      " Directory in which to store history file
let g:yankring_history_file = ".vimyankring"  " Prefix of the history file

if has("nvim")
	" https://github.com/neovim/neovim/issues/2642
	let g:yankring_clipboard_monitor=0
endif
