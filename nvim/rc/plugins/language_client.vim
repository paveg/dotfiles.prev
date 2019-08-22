set hidden

" settings for languages
let g:LanguageClient_serverCommands = {
  \ 'go': ['gopls'],
  \ 'javascript': ['javascript-typescript-langserver', '--stdio'],
  \ 'javascript.tsx': ['javascript-typescript-langserver', '--stdio'],
  \ 'typescript': ['javascript-typescript-langserver', '--stdio'],
  \ 'typescript.tsx': ['javascript-typescript-langserver', '--stdio'],
  \ 'python': ['pyls'],
  \ 'ruby': ['$RBENV_ROOT/shims/solargraph', 'stdio'],
  \ 'cpp': ['clangd'],
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ 'vue': ['vls'],
  \ }

augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1
nnoremap <silent> <Space>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <Space>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <Space>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <Space>lf :call LanguageClient_textDocument_formatting()<CR>
