" TODO:
" - on mac settings(i.e. transparency).
" - folder existing check.
" - Make togglable setting to scroll arrow key.
" FIXME:
" BUGS:
" Note:
" Experimental:

" ready for settings{{{

" if CUI on windows, not set encoding.
if has('win32') && has('gui_running')
  " needs to set before :syntax on and filetype, plugin on.
  set encoding=utf-8
endif
" enable below sentence if I will need.
" source $VIMRUNTIME\delmenu.vim
" set langmenu=ja_JP.utf-8
" source $VIMRUNTIME\menu.vim
scriptencoding utf-8

syntax on
filetype plugin indent on
" not use menu and do fast.
let g:did_install_default_menus = 1

" for load vimrc
augroup vimrc_loading
  autocmd!
augroup END
" }}}


" set options {{{
" When I check option detail, use K key (on windows).
" common settings=======================================================
set autoindent
set background=dark
set backspace=indent,eol,start
set backup
set browsedir=last              " It effect :browse [cmd]
set clipboard+=unnamed
set completeopt=menu,longest
set cursorline
set cursorlineopt=number
set diffopt=filler,iwhite,horizontal
set display=lastline
set expandtab
set foldmethod=marker
set formatoptions+=mM
set helplang=ja
set hidden
set history=50
set hlsearch
set ignorecase
set incsearch
set linespace=0
set list
if &encoding ==# 'utf-8'
  set listchars=tab:‣\ ,trail:_
else
  set listchars=tab:/.,trail:_
endif
set modeline
set modelines=1
set mouse=a
set nomousefocus
set mousehide
set number
set ruler
set showcmd
set showmatch
set signcolumn=number
set smartcase
set smartindent
set smarttab
" Hack #198
set splitbelow
set splitright
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tags& tags+=./tags;tags;
set title
set noundofile
" set whichwrap=b,s,h,l,<,>,[,],~
set virtualedit=block
set wildmenu
set wildmode=longest:list,full
set wrapscan
if has('kaoriya')
  set fileencodings=guess,ucs-bom,iso-2022-jp-3,utf-8,euc-jisx0213,euc-jp
  set formatexpr=autofmt#japanese#formatexpr()
else
  set fileencodings=utf-8,cp932,sjis,ucs-bom,iso-2022-jp-3,euc-jisx0213,euc-jp
endif
if exists('+breakindent')
  set wrap
  set breakindent
else
  set nowrap
endif
" about appearance(or having-number options)============================
set laststatus=2
set showtabline=2
set softtabstop=2
set cmdheight=1
set foldcolumn=0
set scrolloff=5
set sidescroll=1
set switchbuf=usetab,newtab
set sidescrolloff=10
set tabstop=4
set shiftwidth=2
set nrformats=hex,alpha
set textwidth=0
set notimeout
set ttimeout
set timeoutlen=100
if has('gui_running')
  set lines=48
  set columns=84
  " don't want gui parts
  set guioptions=
endif
" with path=============================================================
set runtimepath+=~/.vim/runtime/
set backupdir=~/.vim/bkfiles
set viminfo& viminfo+=n~/.viminfo
if executable('jvgrep')
  set grepprg=jvgrep\ -irR\ --color=never
elseif executable('rg')
  set grepprg=rg\ -nS\ --no-heading
  set grepformat=%f:%l:%m
elseif executable('ag')
  set grepprg=ag\ --nogroup
  set grepformat=%f:%l:%m
endif
if has('unix')
  set backupskip=/tmp/*,/private/tmp/*
endif
" allow gf in current directory with /leading/slash
set includeexpr=substitute(v:fname,'^\\/','','')
set path=;,.,,*
" }}}


" Env-dependent settings {{{
" Terminal {{{
if has('vim_starting')
    " Bar in insert mode
    let &t_SI .= "\e[6 q"
    " Blinking block in normal mode
    let &t_EI .= "\e[2 q"
    " Underline in replace mode
    let &t_SR .= "\e[4 q"

    if exists('+termguicolors')
      " True Color
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif
endif
" }}}

" IME Settings{{{
if has('multi_byte_ime') || has('xim')
  set iminsert=0
  set imsearch=0
  augroup CursorIMColor
    au!
    au ColorScheme * highlight def link CursorIM Search
  augroup END
  if has('xim') && has('GUI_GTK')
    " set starting XIM input keybind:
    " set imactivatekey=s-space
  endif
  " start insert mode with no IME input.
  if has('gui_running') && !has('mac')
    inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
  endif
endif
" }}}
"
" these are almost taken kaoriya settings.{{{
if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

" font setting(based on kaoriya)
if has('win32')
  set guifont=Consolas:h10:cSHIFTJIS
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya') && has('gui_running')
    set ambiwidth=auto
  endif
elseif has('gui_macvim')
  set guifont=Monaco:h12
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif
" }}}
" }}}


" maps and abbreviations{{{
" bind maps
noremap Q gq
noremap <F1> <C-w>g}
noremap! <F1> <C-o><C-w>g}
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> gj j
noremap <silent> gk k
noremap <silent> [[ [[zt
noremap <silent> ]] ]]zt
noremap <silent> ][ ][zb
noremap <silent> [] []zb
nnoremap <Up>    <C-w><Up>
nnoremap <Down>  <C-w><Down>
nnoremap <Left>  <C-w><Left>
nnoremap <Right> <C-w><Right>
nnoremap Y y$
inoremap <C-u> <C-g>u<C-u>
" Experimental: Wrap fold with <CR>.
nnoremap <silent> <CR> :<C-u>silent! normal! za<CR><CR>

" command maps
nnoremap <silent> ,ee :<C-u>e ~/.vim/.vimrc<CR>
nnoremap <silent> ,es :<C-u>sp ~/.vim/.vimrc<CR>
nnoremap <silent> ,ev :<C-u>vs ~/.vim/.vimrc<CR>
nnoremap <silent> ,et :<C-u>tabe ~/.vim/.vimrc<CR>
nnoremap <silent> ,r :<C-u>source $MYVIMRC<CR>
nnoremap <silent> <F3> :let &ts=(&ts*2 > 16 ? 2 : &ts*2)<cr>:echo "tabstop: " . &ts<cr>
nnoremap B :ls<CR>:b
" nnoremap : q:i
" It doesn't work incsearch.
"   nnoremap / q/i
vnoremap p pgvy
vnoremap P Pgvy

" abbreviations
" When I use :w! command, it maybe explicitly.
" It also define in autocmd section.
" cnoreabbrev w up
" }}}


" autocmds{{{
augroup vimrc_loading
  " autocmd CmdWinEnter * nnoremap <buffer><silent> q :<C-u>quit<CR>
  " autocmd CmdWinEnter * nnoremap <buffer><silent> <ESC> :<C-u>quit<CR>
  autocmd CmdWinEnter * inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
  autocmd CmdWinEnter * inoremap <buffer><silent> <C-r><C-w> <C-c><C-r><C-w><C-f>i
  " autocmd CmdWinEnter * inoremap <buffer><silent> <C-r><C-w> <C-r>=matchstr(@/,'\\<\zs.*\ze\\>')<cr>
  " autocmd CmdWinEnter * inoreabbrev <buffer> w up
  autocmd CmdWinEnter * setlocal backspace-=eol
  autocmd CmdWinEnter * setlocal completeopt+=longest
  autocmd CmdwinLeave * setlocal completeopt-=longest
  autocmd CmdWinLeave * setlocal backspace+=eol

  " Experimental: smart lcd
  if has('win32') && has('gui_running')
    cd $HOME
    autocmd BufReadPost * if @# == '' && getcwd() == $HOME | cd %:p:h | endif
  endif

  if exists('+transparency')
    if has('win32')
      autocmd FocusGained * set transparency=248
      autocmd FocusLost * set transparency=192
    elseif has('gui_macvim')
      autocmd FocusGained * set transparency=10
      autocmd FocusLost * set transparency=50
    endif
  endif

  if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
          \   if &omnifunc == "" |
          \       setlocal omnifunc=syntaxcomplete#Complete |
          \   endif
  endif

  " Jump last editing line when open buffer
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " autocmd FileType jsp,asp,php,xml,perl syntax sync minlines=500 maxlines=1000
augroup END

" " binary XXD editing mode
" FIXME: This causes to prevent to fire other BufWritePre events
" augroup BinaryXXD
"   autocmd!
"   autocmd BufReadPre  *.bin let &binary =1
"   autocmd BufReadPost * if &binary | silent %!xxd -g 1
"   autocmd BufReadPost * set ft=xxd | endif
"   autocmd BufWritePre * if &binary | %!xxd -r
"   autocmd BufWritePre * endif
"   autocmd BufWritePost * if &binary | silent %!xxd -g 1
"   autocmd BufWritePost * set nomod | endif
" augroup END

" }}}


" setting values{{{
" netrw is always tree view.
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" HTML indent vals
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" PHP switch case/default indent
let g:PHP_vintage_case_default_indent = 1
" Ruby indent stype for access modifier
let g:ruby_indent_access_modifier_style="indent"
" }}}


" colorscheme and highlightings{{{
augroup vimrc_loading
  autocmd VimEnter,ColorScheme * highlight def link IdeographicSpace Visual
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" }}}


" commands & functions {{{
" bdelete/bwipeout without break window layout.
" command! BDelete b#|bd#
" command! BWipeout enew|bw#
command! W setl wrap! wrap?
" }}}


" plugin setting file
source ~/.vim/.vimrc.bundle

" vim: ft=vim:et:sw=2:sts=2:fdm=marker :
