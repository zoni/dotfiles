" Open URL
command -bar -nargs=1 OpenURL :!xdg-open <args>
function! OpenURL()
let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
echo s:uri
if s:uri != ""
    exec "!xdg-open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
