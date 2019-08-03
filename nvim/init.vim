filetype plugin indent off

" Able to control mouse
set mouse=a

" Use true colors on terminal
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Every launguage paths
let g:python_host_prog = expand('$PYENV_ROOT/shims/python2')
let g:python3_host_prog = expand('$PYENV_ROOT/shims/python3')
let g:ruby_host_prog = expand('$RBENV_ROOT/shims/ruby')

" Combine clipboard
set clipboard+=unnamedplus

" Displays title and line number
set title
set number

" Multi byte character config
set ambiwidth=double
" Do not make swapfile
set noswapfile

set list
set listchars=tab:>-,trail:*,nbsp:+

set smartindent

set expandtab
set tabstop=2
set shiftwidth=2

" Reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

function! s:load(file) abort
  let s:path = expand('$CONFIG/nvim/rc/' . a:file . '.vim')

  if filereadable(s:path)
    execute 'source' fnameescape(s:path)
  endif
endfunction

call s:load('plugins')

filetype plugin indent on
syntax on
