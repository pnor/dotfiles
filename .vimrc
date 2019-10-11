
" Vim-Plug---
" ---------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Functionality-----

" youcompleteme
Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 install.py --clang-completer --java-completer' }
" NERDtree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
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
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'

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

" Personal Settings--------------------------------------------------------------------
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

" Plugin Settings---------------------------------------------------------------------
" youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
""let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'

" Vim airline fix + theme
let g:airline_powerline_fonts = 1
let g:airline_theme='sharkbites'
set noshowmode
"let g:airline_theme='ouo'


" NERDTree 
:let g:NERDTreeWinSize=30
" Open tree with "\t"
map <Leader>t :NERDTreeToggle<CR>
" Open tree when starting a vim session with 'vim'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Unicode for NERDTree icons
set encoding=UTF-8
" NERDtree colors
:hi Directory guifg=#FF0000 ctermfg=cyan

" ALE gutter color and symbols
highlight clear SignColumn
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '*'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Rainbow Parenthesis
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


set dir=~/tmp
execute pathogen#infect()
call pathogen#helptags()

" Color Scheme Setup
"let g:purify_italic = 0
colo sharkbites 
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE
