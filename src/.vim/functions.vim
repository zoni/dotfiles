" vim: foldmethod=marker

" {{{ Open URL
command! -bar -nargs=1 OpenURL :!xdg-open <args>
function! OpenURL()
let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
echo s:uri
if s:uri != ""
    exec "!xdg-open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
" }}}

" {{{ Custom functions (python 3)
if has('python3')
" Execute a selection of code
" Use VISUAL to select a range and then hit ctrl-e to execute it.
python3 << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-e> :py3 EvaluateCurrentRange()<CR>

" Functions to set/remove Python (pdb) breakpoints.
" Will add an import pdb statement automatically, as well as
" remove it once the last breakpoint is removed.
python3 << EOF
def SetBreakpoint():
    import re
    nLine = int( vim.eval( 'line(".")'))

    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)

    vim.current.buffer.append(
       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break
    else:
        vim.current.buffer.append( 'import pdb', 0)
        vim.command( 'normal j1')

def RemoveBreakpoints():
    import re

    nCurrentLine = int( vim.eval( 'line(".")'))

    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == "import pdb" or strLine.lstrip()[:15] == "pdb.set_trace()":
            nLines.append( nLine)
        nLine += 1

    nLines.reverse()

    for nLine in nLines:
        vim.command( "normal %dG" % nLine)
        vim.command( "normal dd")
        if nLine < nCurrentLine:
            nCurrentLine -= 1

    vim.command( "normal %dG" % nCurrentLine)
EOF
endif
" }}}

" {{{ Custom functions (python 2)
if has('python')

" Execute a selection of code
" Use VISUAL to select a range and then hit ctrl-e to execute it.
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-e> :python EvaluateCurrentRange()<CR>

" Functions to set/remove Python (pdb) breakpoints.
" Will add an import pdb statement automatically, as well as
" remove it once the last breakpoint is removed.
python << EOF
def SetBreakpoint():
    import re
    nLine = int( vim.eval( 'line(".")'))

    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)

    vim.current.buffer.append(
       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break
    else:
        vim.current.buffer.append( 'import pdb', 0)
        vim.command( 'normal j1')

def RemoveBreakpoints():
    import re

    nCurrentLine = int( vim.eval( 'line(".")'))

    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == "import pdb" or strLine.lstrip()[:15] == "pdb.set_trace()":
            nLines.append( nLine)
        nLine += 1

    nLines.reverse()

    for nLine in nLines:
        vim.command( "normal %dG" % nLine)
        vim.command( "normal dd")
        if nLine < nCurrentLine:
            nCurrentLine -= 1

    vim.command( "normal %dG" % nCurrentLine)
EOF
endif
" }}}
