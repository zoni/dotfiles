let mapleader = "\<Space>"
set nocompatible        " Use Vim defaults (much better!)
set nospell             " Spell breaks many color schemes
set backspace=eol,start,indent " Allow backspacing over beginning of line, indent, etc.
set ai                  " Always set auto-indenting on
set history=50          " keep 50 lines of command history
set viminfo='20,\"500   " Keep a .viminfo file.
set foldmethod=marker   " Use manual fold markers as default fold method
set foldlevelstart=99   " Don't fold anything by default
set laststatus=2        " Always show the statusline
"set autochdir          " Auto cwd to the current file's dir. Not compatible with all plugins
"set virtualedit=onemore " Allow for cursor to go beyond last character by 1
set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys also wrap to next/previous line
set scrolljump=1        " Scroll this many lines when cursor leaves screen
set scrolloff=5         " Leave this many lines visible above/below cursor
set hidden              " Allow switching buffers without saving
set showcmd             " Show (partial) command in the last line of the screen
set splitbelow
set splitright
set timeoutlen=2500     " Timeout for key sequences. Default is 1000ms.

" Locations of backups/views/etc
set backupdir=$HOME/.vimbackup/
set directory=$HOME/.vimswap/
set viewdir=$HOME/.vimviews/

" When doing tab completion, give the following files lower priority
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo
" And ignore these entirely
set wildignore=.pyc,.swp,.swo
" When completing, automatically expand as far as possible, then show
" remaining possibilities in a list
set wildmode=longest,list

augroup views
	au!
	" Automatically saves views on exit, load on open
	au BufWinLeave ?+ mkview
	au BufWinEnter ?+ silent loadview

	" Jump to last cursor position when opening new files
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Disable potentially unsafe modelines, use ciaranm/securemodelines
set nomodeline
let g:secure_modelines_allowed_items = [
    \ "textwidth",   "tw",
    \ "softtabstop", "sts",
    \ "tabstop",     "ts",
    \ "shiftwidth",  "sw",
    \ "expandtab",   "et",   "noexpandtab", "noet",
    \ "filetype",    "ft",
    \ "foldmethod",  "fdm",
    \ "readonly",    "ro",   "noreadonly", "noro",
    \ "rightleft",   "rl",   "norightleft", "norl"
    \ ]
let g:secure_modelines_verbose = 1
