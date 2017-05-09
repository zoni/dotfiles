" If you're not getting the full 256 colors even if your terminal supports it,
" you can force vim to use 256 colors anyway with the following option. Better 
" to fix your terminal to advertise 256 color support though. (tmux is
" notoriously bad at reporting it by default. Try `tmux -2` to force it)
set t_Co=256

color mustang

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
let g:airline_theme = "papercolor"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
