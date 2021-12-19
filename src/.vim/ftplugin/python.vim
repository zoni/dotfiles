let b:ale_fixers = ['isort', 'black']

" Flake8 does not support reading from pyproject.toml
" (https://github.com/PyCQA/flake8/issues/234) which annoys me enough to not
" bother with it. Additionally, tools like black and pylint overlap with some
" of its functionality anyway.
let g:ale_linters_ignore = ['flake8']
