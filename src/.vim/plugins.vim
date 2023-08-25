" vim: foldmethod=marker

" {{{ ALE
" Note: fixers are defined in ftplugin files (see ~/.vim/ftplugin/) as per
" https://github.com/dense-analysis/ale#2ii-fixing

let g:ale_fix_on_save = 1
let g:ale_markdown_remark_lint_executable = 'docker'
let g:ale_markdown_remark_lint_options = 'run --rm -i -v "$(pwd):/project:ro" quay.io/zoni/remark-lint'
let g:ale_markdown_remark_lint_use_global = 1

" Avoids problems with missing symbols when packages are spread across
" multiple files.
let g:ale_go_golangci_lint_package = 1

" Only use type checkers and ruff for Python projects.
" (Ruff covers the majority of what other linters can do combined).
let g:ale_linters = {'python': ['ruff', 'mypy', 'pyright']}
" }}}

" {{{ echodoc
let g:echodoc_enable_at_startup = 1
" }}}

" {{{ Fzf
let g:fzf_command_prefix = 'Fzf'
" }}}

" {{{ gitgutter
let g:gitgutter_map_keys = 0
" }}}

" {{{ Gundo
let g:gundo_prefer_python3 = 1
let g:gundo_return_on_revert = 0

nmap <silent> <leader>u :GundoToggle<CR>
" }}}

" {{{ Python
if has('python3')
    let g:pymode_python = 'python3'
endif

let g:SimpylFold_docstring_preview = 0
let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1

augroup pythonau
    au!
    au FileType python setlocal completeopt-=preview
    au BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
    au BufWinLeave *.py setlocal foldexpr< foldmethod<
augroup END
" }}}

" {{{ Bufexplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerSplitOutPathName=0
" }}}

" {{{ Netrw
let g:netrw_liststyle = 1

augroup netrwau
    au!
    au FileType netrw setlocal cursorline nolist
augroup END
" }}}

" {{{ Supertab
" Let SuperTab try to determine best completion type automatically based on
" text preceding the cursor.
let g:SuperTabDefaultCompletionType = "context"
" }}}

" {{{ Deoplete
" More options in .vimrc due to plugin loading
let g:deoplete#enable_at_startup = 1
" }}}

" {{{ vim-swoop
let g:swoopUseDefaultKeyMap = 0
" }}}

" {{{ vim-mix-format
let g:mix_format_on_save = 0
let g:mix_format_options = '--check-equivalent'
let g:mix_format_silent_errors = 1

" mix_format_on_save tends to throw errors when multiple buffers have been
" opened via netrw, the BufWritePre autocommand works around this.
augroup elixirau
    au!
    au BufWritePre *.ex,*.exs execute "MixFormat"
augroup END
" }}}

" {{{ ctrlsf
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_auto_close = {
    \ "normal" : 1,
    \ "compact": 1
\ }
let g:ctrlsf_auto_focus = {
    \ "at" : "start"
\ }
let g:ctrlsf_default_root = 'project+fw'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_mapping = {
  \ "open"    : ["<CR>", "o"],
  \ "openb"   : {"key": ["O", "<leader>"], "suffix": "<C-w>p"},
  \ "split"   : "<C-O>",
  \ "vsplit"  : "",
  \ "tab"     : "t",
  \ "tabb"    : "T",
  \ "popen"   : "p",
  \ "popenf"  : "P",
  \ "quit"    : "q",
  \ "next"    : "<C-J>",
  \ "prev"    : "<C-K>",
  \ "pquit"   : "q",
  \ "loclist" : "",
  \ "chgmode" : ["M", "<tab>"],
  \ "stop"    : "<C-C>",
\ }
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_search_mode = 'sync'

let g:ctrlsf_ackprg = 'rg'
let g:ctrlsf_extra_backend_args = {
  \ 'rg': '--hidden'
\ }

" }}}

" {{{ tagbar
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_sort = 0
let g:tagbar_compact = 0

" https://github.com/majutsushi/tagbar/wiki#ansible
let g:tagbar_type_ansible = {
    \ 'ctagstype' : 'ansible',
    \ 'kinds' : [
        \ 't:tasks'
    \ ],
    \ 'sort' : 0
\ }

" https://github.com/majutsushi/tagbar/wiki#asciidoc
let g:tagbar_type_asciidoc = {
    \ 'ctagstype' : 'asciidoc',
    \ 'kinds' : [
        \ 'h:table of contents',
        \ 'a:anchors:1',
        \ 't:titles:1',
        \ 'n:includes:1',
        \ 'i:images:1',
        \ 'I:inline images:1'
    \ ],
    \ 'sort' : 0
\ }

" https://github.com/majutsushi/tagbar/wiki#elixir
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

" https://github.com/majutsushi/tagbar/wiki#markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" https://github.com/majutsushi/tagbar/wiki#makefile-targets
let g:tagbar_type_make = {
    \ 'kinds':[
        \ 'm:macros',
        \ 't:targets'
    \ ]
\}

" https://github.com/majutsushi/tagbar/wiki#puppet
let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
      \]
\}

" https://github.com/majutsushi/tagbar/wiki#restructuredtext
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : 'rst2ctags',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
" }}}

" {{{ vim-markdown-composer
let g:markdown_composer_browser = "firefox"
let g:markdown_composer_open_browser = 0
" }}}

" {{{ bclose.vim
let g:bclose_no_plugin_maps = 1
" }}}

" {{{ rust.vim
let g:rustfmt_autosave = 0
" }}}

" {{{ vim-terraform
let g:terraform_fmt_on_save = 1
" }}}

" {{{ symbols-outline
" https://github.com/simrat39/symbols-outline.nvim
lua << EOF
local opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = {
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = {icon = "", hl = "TSURI"},
    Module = {icon = "", hl = "TSNamespace"},
    Namespace = {icon = "", hl = "TSNamespace"},
    Package = {icon = "", hl = "TSNamespace"},
    Class = {icon = "𝓒", hl = "TSType"},
    Method = {icon = "ƒ", hl = "TSMethod"},
    Property = {icon = "", hl = "TSMethod"},
    Field = {icon = "", hl = "TSField"},
    Constructor = {icon = "", hl = "TSConstructor"},
    Enum = {icon = "ℰ", hl = "TSType"},
    Interface = {icon = "ﰮ", hl = "TSType"},
    Function = {icon = "", hl = "TSFunction"},
    Variable = {icon = "", hl = "TSConstant"},
    Constant = {icon = "", hl = "TSConstant"},
    String = {icon = "𝓐", hl = "TSString"},
    Number = {icon = "#", hl = "TSNumber"},
    Boolean = {icon = "⊨", hl = "TSBoolean"},
    Array = {icon = "", hl = "TSConstant"},
    Object = {icon = "⦿", hl = "TSType"},
    Key = {icon = "🔐", hl = "TSType"},
    Null = {icon = "NULL", hl = "TSType"},
    EnumMember = {icon = "", hl = "TSField"},
    Struct = {icon = "𝓢", hl = "TSType"},
    Event = {icon = "🗲", hl = "TSType"},
    Operator = {icon = "+", hl = "TSOperator"},
    TypeParameter = {icon = "𝙏", hl = "TSParameter"}
  }
}
require("symbols-outline").setup(opts)
EOF
" }}}
