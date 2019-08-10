filetype plugin indent off

" Able to control mouse
set mouse=a

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Every launguage paths
if isdirectory(expand('$PYENV_ROOT' .'/versions/nvim-python2/bin'))
  let g:python_host_prog = expand('$PYENV_ROOT' . '/versions/nvim-python2/bin/python')
endif
if isdirectory(expand('$PYENV_ROOT' . '/versions/nvim-python3/bin'))
  let g:python3_host_prog = expand('$PYENV_ROOT' . '/versions/nvim-python3/bin/python')
endif
let g:ruby_host_prog = expand('$ANYENV_ROOT' . '/envs/rbenv/shims/ruby')
let g:node_host_prog = expand('$ANYENV_ROOT' . '/envs/nodenv/shims/node')

" Combine clipboard
set clipboard+=unnamedplus

" Displays title and line number
set title
set number

" Multi byte character config
set ambiwidth=double

" Do not make swapfile
set noswapfile
set autoread

set list
set listchars=tab:>-,trail:*,nbsp:+

set smartindent

set expandtab
set tabstop=2
set shiftwidth=2

" Paste command in correctly
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif

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

" Remapping jj to escape
inoremap <silent> jj <ESC>

" Use true colors on terminal
syntax enable
set termguicolors
set t_Co=256
set background=dark
colorscheme material-theme

syntax on
filetype plugin indent on
