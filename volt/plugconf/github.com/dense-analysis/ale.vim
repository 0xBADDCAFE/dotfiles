" vim:et:sw=2:ts=2

" Plugin configuration like the code written in vimrc.
" This configuration is executed *before* a plugin is loaded.
function! s:on_load_pre()
  let g:ale_linters = {
        \   'go': ['gometalinter', 'gofmt'],
        \   'java': [],
        \   'kotlin': [],
  }
  let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'javascript': ['prettier'],
        \   'typescript': ['prettier'],
        \   'javascriptreact': ['prettier'],
        \   'typescriptreact': ['prettier'],
        \   'css': ['prettier'],
        \   'php': ['prettier'],
        \}
  " let g:ale_fixers['javascript'] = ['prettier-eslint']
  " let g:ale_fixers['typescript'] = ['tslint']

  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_fix_on_save = 0
  nmap <Space>l <Plug>(ale_fix)

  let g:ale_pattern_options = {
        \   '.*\.json$': {'ale_enabled': 0},
        \   '.*node_modules/.*': {'ale_enabled': 0},
        \}

  let g:ale_javascript_prettier_use_local_config = 1
  let g:ale_completion_tsserver_autoimport = 1
  " let g:ale_php_phpcbf_standard = 'PSR1,PSR2'
endfunction

" Plugin configuration like the code written in vimrc.
" This configuration is executed *after* a plugin is loaded.
function! s:on_load_post()
endfunction

" This function determines when a plugin is loaded.
"
" Possible values are:
" * 'start' (a plugin will be loaded at VimEnter event)
" * 'filetype=<filetypes>' (a plugin will be loaded at FileType event)
" * 'excmd=<excmds>' (a plugin will be loaded at CmdUndefined event)
" <filetypes> and <excmds> can be multiple values separated by comma.
"
" This function must contain 'return "<str>"' code.
" (the argument of :return must be string literal)
function! s:loaded_on()
  return 'start'
endfunction

" Dependencies of this plugin.
" The specified dependencies are loaded after this plugin is loaded.
"
" This function must contain 'return [<repos>, ...]' code.
" (the argument of :return must be list literal, and the elements are string)
" e.g. return ['github.com/tyru/open-browser.vim']
function! s:depends()
  return []
endfunction
