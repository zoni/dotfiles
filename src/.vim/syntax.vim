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
    au FileType asciidoc   setlocal et spell
    au FileType css        setlocal et shiftwidth=2
    au FileType html       setlocal et
    au FileType markdown   setlocal et spell
    au FileType rst        setlocal et spell
    au FileType scss       setlocal et shiftwidth=2
    au FileType vue        setlocal et
    au FileType yaml       setlocal shiftwidth=2
augroup END

augroup terraformau
    au!
    " This doesn't seem to work when placed in filetypesyntaxopts with `au FileType terraform`.
    au BufNewFile,Bufread *.tf setlocal et shiftwidth=2
augroup END
