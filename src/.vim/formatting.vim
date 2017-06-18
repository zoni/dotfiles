" autoindenting (local to buffer)
set ai
" smartindenting (clever autoindenting)
set si
" c-style indenting. (Auto-tabs after '{' for example)
"set cindent

" Show tabs as four characters long
set tabstop=4
set softtabstop=4
" Indent by 4 characters at a time as well, like tabs
set shiftwidth=4
" Don't replace tabs by spaces
set noexpandtab

" On softwrap, display wrapped lines at consistent indent
set breakindent

" Set text formatting options - see `:help fo-table` for valid options
set formatoptions=cqrtj

" Enable plugin-provided indent settings
filetype plugin indent on

let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit', 'rst']
