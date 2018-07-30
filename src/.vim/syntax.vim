" My /bin/sh is bash, not ksh, so syntax highlighting for .sh files
" should default to bash. See :help sh-syntax and Gentoo bug #101819.
if has("eval")
  let is_bash=1
endif

" Syntax highlighting overrides - These take precedence over autodetection
" (setf)
augroup filetypedetect
	au!
	au BufNewFile,BufRead *.lsl            set filetype=lsl
	au BufNewFile,BufRead Vagrantfile      set filetype=ruby

	" Source explicitly so that YAML filetype plugin is used regardless of
	" what may be installed already on this system. Ensures this is picked
	" over the Debian/Ubuntu provided yaml.vim on these distributions.
	au BufNewFile,BufRead *.yaml,*.yml     source ~/.vim/extra/yaml.vim
augroup END

augroup filetypesyntaxopts
	au!
	au FileType markdown   setlocal et tw=74 spell
	au FileType rst        call SetSyntasticCheckerForSphinxProjects()
	au FileType rst        setlocal et tw=74 spell
	au FileType vue        setlocal et
	au FileType yaml       setlocal shiftwidth=2
augroup END

function! SetSyntasticCheckerForSphinxProjects()
	let buf = bufnr('')
	let config = syntastic#util#findFileInParent('conf.py', fnamemodify(bufname(buf), ':p:h'))
	if config ==# '' || !filereadable(config)
		return
	endif
	let g:syntastic_rst_checkers = ['sphinx']
endfunction
