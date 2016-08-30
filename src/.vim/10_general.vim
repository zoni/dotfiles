set nocompatible        " Use Vim defaults (much better!)
set nospell             " Spell breaks many color schemes
set backspace=eol,start,indent " Allow backspacing over beginning of line, indent, etc.
set ai                  " Always set auto-indenting on
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time
set relativenumber      " Number lines relative to the current line
set number              " Display line numbers (on the left-hand side) by default
set numberwidth=4       " Use at least this many columns for the line numbers
set viminfo='20,\"500   " Keep a .viminfo file.
set nomodeline          " Ignore modelines in files
set foldmethod=marker   " Use manual fold markers as default fold method
set laststatus=2        " Always show the statusline
"set autochdir          " Auto cwd to the current file's dir. Not compatible with all plugins
"set virtualedit=onemore " Allow for cursor to go beyond last character by 1
set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys also wrap to next/previous line
set scrolljump=1        " Scroll this many lines when cursor leaves screen
set scrolloff=5         " Leave this many lines visible above/below cursor
set hidden              " Allow switching buffers without saving

" Locations of backups/views/etc
set backupdir=$HOME/.vimbackup/
set directory=$HOME/.vimswap/
set viewdir=$HOME/.vimviews/

" Highlight problematic whitespace
set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:.

" Don't use Ex mode, use Q for formatting
map Q gq

" When doing tab completion, give the following files lower priority
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo
" And ignore these entirely
set wildignore=.pyc,.swp,.swo
" When completing, automatically expand as far as possible, then show
" remaining possibilities in a list
set wildmode=longest,list

" Automatically saves views on exit, load on open
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" Quit vim when only a NERDTree window remains open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                          " automatic formatting is to be done.
                          "
                          " letter    meaning when present in 'formatoptions'
                          " ------    ---------------------------------------
                          " c         Auto-wrap comments using textwidth, inserting
                          "           the current comment leader automatically.
                          " q         Allow formatting of comments with "gq".
                          " r         Automatically insert the current comment leader
                          "           after hitting <Enter> in Insert mode.
                          " t         Auto-wrap text using textwidth (does not apply
                          "           to comments)
