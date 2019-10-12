
" Vim-Plug---
" ---------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Functionality-----

" youcompleteme
Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 install.py --clang-completer --java-completer' }

" ALE
Plug 'w0rp/ale'
" Sneak
Plug 'justinmk/vim-sneak'

" Appearence-----
" Vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Rainbow Parenthesis
Plug 'luochen1990/rainbow'
" indentLine
Plug 'Yggdroot/indentLine'
" Swift completion theme
Plug 'keith/swift.vim'

" ColorThemes-----
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim' " For the Airline theme

call plug#end()


" Vim Settings---
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Enable true color 启用终端24位色
 if exists('+termguicolors')
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   set termguicolors
 endif

 " Enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
"set t_ZH=[3m
"set t_ZR=[23m

" Personal Settings----------------------------------------------------
" Remove dog trails
set noswapfile
set nobackup
set noundofile

" Add syntax highlighting
syntax on

" Add line Numbers
set number

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Tabs are 4 spaces for proper files
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Set Color Scheme----------
"let g:purify_italic = 0
colo glow-in-the-dark-gucci-shark-bites-edit
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE

" Plugin Settings--------------------------------------
" youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
""let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'

" Vim airline fix + theme
let g:airline_powerline_fonts = 1
let g:airline_theme='sharkbites'
"let g:airline_theme='ouo'
set noshowmode

" ALE gutter color and symbols
highlight clear SignColumn
let g:ale_sign_error = ' x'
let g:ale_sign_warning = ' *'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Rainbow Parenthesis
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


set dir=~/tmp
execute pathogen#infect()
call pathogen#helptags()


