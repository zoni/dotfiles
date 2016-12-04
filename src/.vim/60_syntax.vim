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

" My /bin/sh is bash, not ksh, so syntax highlighting for .sh files
" should default to bash. See :help sh-syntax and Gentoo bug #101819.
if has("eval")
  let is_bash=1
endif

" Syntax highlighting overrides - These take precedence over autodetection
" (setf)
augroup filetypedetect
	au BufNewFile,BufRead *.lsl            set filetype=lsl
	au BufNewFile,BufRead Vagrantfile      set filetype=ruby

	" Source explicitly so that YAML filetype plugin is used regardless of
	" what may be installed already on this system. Ensures this is picked
	" over the Debian/Ubuntu provided yaml.vim on these distributions.
	au BufNewFile,BufRead *.yaml,*.yml     source ~/.vim/extra/yaml.vim
augroup END
