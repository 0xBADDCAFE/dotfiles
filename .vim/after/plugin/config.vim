" plugin_setting_template {{{
" let g:variable = 0
" }}}

" standard plugins {{{
if !exists('loaded_matchit')
  " enable matchit
  runtime macros/matchit.vim
endif
" }}}
" vim-parenmatch {{{
if !empty(globpath(&rtp, 'autoload/parenmatch.vim'))
  let g:loaded_matchparen = 1
endif
" }}}
" ctrlp{{{
if !empty(globpath(&rtp, 'autoload/ctrlp.vim'))
  let g:ctrlp_cmd = 'CtrlPMRUFiles'
  exe 'nn <silent> <plug>(ctrlp) :<c-u>'.g:ctrlp_cmd.'<cr>'
  " The maximum number of files to scan, set to 0 for no limit: >
  " let g:ctrlp_max_files = 1000
  " Set this to 0 to show the match window at the top of the screen: >
  let g:ctrlp_match_window_bottom = 1
  " Change the listing order of the files in the match window. The default setting
  " (1) is from bottom to top: >
  let g:ctrlp_match_window_reversed = 0
  let g:ctrlp_max_height = 16
  " let g:ctrlp_max_files = 3000
  let g:ctrlp_clear_cache_on_exit = 0
  " has migemo?
  if executable('CMigemo')
    let g:ctrlp_use_migemo = 1
  endif
  " let g:ctrlp_extensions = ['mixed']
  let g:ctrlp_prompt_mappings = {
        \ 'PrtSelectMove("j")':   ['<C-j>', '<tab>', '<down>'],
        \ 'PrtSelectMove("k")':   ['<C-k>', '<s-tab>', '<up>'],
        \ 'ToggleFocus()':        ['<NOP>'],
        \ 'PrtExpandDir()':       ['<NOP>'],
        \ }

  " funky{{{
  nnoremap <F11> :CtrlPFunky<CR>
  let g:ctrlp_funky_syntax_highlight = 1
  " }}}
endif
" }}}
" restart {{{
if !empty(globpath(&rtp, 'autoload/restart.vim'))
  " if enable restart session, leave session files in
  " current dir...
  " let g:restart_sessionoptions=&sessionoptions
  let g:restart_sessionoptions="winsize,winpos"
endif
" }}}
" airline {{{
if !empty(globpath(&rtp, 'autoload/airline.vim'))
  let g:airline_detect_iminsert=1
  if &encoding ==# 'utf-8'
    let g:airline_powerline_fonts=1
    if has('mac')
      let g:airline_left_sep = '⮀'
      let g:airline_left_alt_sep = '⮁'
      let g:airline_right_sep = '⮂'
      let g:airline_right_alt_sep = '⮃'

      if !exists('g:airline_symbols')
        let g:airline_symbols = {}
      endif

      " {'space': ' ', 'paste': 'PASTE', 'maxlinenr': ' ', 'notexists': 'Ɇ', 'linenr': '☰ ', 'readonly': '', 'spell': 'SPELL', 'modified': '+', 'keymap': 'Keymap:', 'crypt': '🔒 ', 'branch': '', 'whitespace': '☲'}

      let g:airline_symbols.maxlinenr    = ' ⭡'
      let g:airline_symbols.readonly  = '⭤'
      let g:airline_symbols.branch    = '⭠'
    endif
  endif

  " let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#whitespace#checks = []
endif
" }}}
" textobj-multiblock {{{
if !empty(globpath(&rtp, 'autoload/textobj/multiblock.vim'))
  omap ab <Plug>(textobj-multiblock-a)
  omap ib <Plug>(textobj-multiblock-i)
  vmap ab <Plug>(textobj-multiblock-a)
  vmap ib <Plug>(textobj-multiblock-i)
endif
" }}}
" operator-camelize {{{
if !empty(globpath(&rtp, 'autoload/operator/camelize.vim'))
  map <Space>c <Plug>(operator-toggle-camel-snake)
endif
" }}}
" memolist.vim {{{
if !empty(globpath(&rtp, 'autoload/memolist.vim'))
  nmap m, :exe "CtrlP" g:memolist_path<cr><f5>
endif
" }}}
" vim-quickrun {{{
if !empty(globpath(&rtp, 'autoload/quickrun.vim'))
  " let g:quickrun_config = {}
  " TODO: install openbrowser.vim
  " let g:quickrun_config.markdown = {
  "       \ 'type'      : 'markdown/pandoc',
  "       \ 'outputter' : 'browser',
  "       \ 'cmdopt'    : '-s'
  "       \ }
  " remap exec commands
  map <Leader>rr <Plug>(quickrun)
  nnoremap <Leader>ri :<C-u>QuickRun -mode n -input input<CR>
endif
" }}}
" phpcomplete {{{
if !empty(globpath(&rtp, 'autoload/phpcomplete.vim'))
  let g:phpcomplete_index_composer_command='composer'
endif
" }}}
" vim-php-namespace {{{
if !empty(globpath(&rtp, 'plugin/phpns.vim'))
  function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
  endfunction
  autocmd vimrc_loading FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
  autocmd vimrc_loading FileType php noremap <Leader>u :call PhpInsertUse()<CR>
endif
" }}}
" autoprogramming {{{
if !empty(globpath(&rtp, 'autoload/autoprogramming.vim'))
  set completefunc=autoprogramming#complete
endif
" }}}
" dirvish {{{
if !empty(globpath(&rtp, 'autoload/dirvish.vim'))
  autocmd vimrc_loading FileType dirvish keeppatterns g@\v/\.[^\/]+/?$@d
endif
" }}}
" table mode {{{
if !empty(globpath(&rtp, 'autoload/tablemode.vim'))
  let g:table_mode_corner="|"
endif
" }}}

" Settings that require the plugin to be loaded first
" colorschemes{{{
autocmd vimrc_loading VimEnter,ColorScheme * highlight CursorLine NONE
" TODO: separate settings by g:colors_name value.
if has('gui_running')
  if !empty(globpath(&rtp, 'colors/lucius.vim'))
    colorscheme lucius
  endif
else
  if !empty(globpath(&rtp, 'colors/gotham.vim'))
    if exists('+termguicolors')
      autocmd vimrc_loading VimEnter,ColorScheme * highlight Normal guibg=NONE
      autocmd vimrc_loading VimEnter,ColorScheme * highlight NonText guibg=NONE
      autocmd vimrc_loading VimEnter,ColorScheme * highlight TablineSel guibg=NONE

      autocmd vimrc_loading VimEnter * highlight Tabline guibg=#195466
      autocmd vimrc_loading VimEnter * highlight TablineFill guibg=#195466
      autocmd vimrc_loading ColorScheme gotham highlight Tabline guibg=#195466
      autocmd vimrc_loading ColorScheme gotham highlight TablineFill guibg=#195466

      colorscheme gotham
    elseif
      autocmd vimrc_loading VimEnter,ColorScheme * highlight Normal ctermbg=NONE
      autocmd vimrc_loading VimEnter,ColorScheme * highlight NonText ctermbg=NONE
      autocmd vimrc_loading VimEnter,ColorScheme * highlight TablineSel ctermbg=NONE

      autocmd vimrc_loading VimEnter * highlight Tabline ctermbg=24
      autocmd vimrc_loading VimEnter * highlight TablineFill ctermbg=24
      autocmd vimrc_loading ColorScheme gotham256 highlight Tabline ctermbg=24
      autocmd vimrc_loading ColorScheme gotham256 highlight TablineFill ctermbg=24

      colorscheme gotham256
    endif
  endif
endif
" }}}

" vim: ft=vim:et:sw=2:sts=2:fdm=marker :
