" This has been a favorite for a long time, keeping it commented here for
" reference.
"color mustang

set termguicolors
colorscheme one
set background=dark

if has("gui_running")
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
endif

" Display line numbers
set ruler               " Show the cursor position all the time
set relativenumber      " Number lines relative to the current line
set number              " Display line numbers (on the left-hand side) by default
set numberwidth=4       " Use at least this many columns for the line numbers

" Highlight problematic whitespace
set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:.

" Highlight current line
set cursorline

let g:airline_powerline_fonts = 1
let g:airline_theme = "one"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
