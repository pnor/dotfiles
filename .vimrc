" ---------------------------------------------------------------------------- "
" Vim-Plug                                                                     "
" ---------------------------------------------------------------------------- "
call plug#begin('~/.vim/plugged')
" - Functionality
Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 install.py --clang-completer --java-completer' } " youcompleteme
Plug 'w0rp/ale'                 " ALE
Plug 'justinmk/vim-sneak'       " Sneak
" - Appearence
Plug 'vim-airline/vim-airline'          " Vim-airline
Plug 'vim-airline/vim-airline-themes'   " Vim-airline Themes
Plug 'luochen1990/rainbow'              " Rainbow Parenthesis
Plug 'Yggdroot/indentLine'              " indentLine
Plug 'keith/swift.vim'                  " Swift Syntax Suppoer
" - ColorThemes
Plug 'kyoz/purify', { 'rtp': 'vim' }                        " Purify
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'    " Shark bites Airline Theme 

call plug#end()


" ---------------------------------------------------------------------------- "
" Vim Config                                                                   "
" ---------------------------------------------------------------------------- "
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


" ---------------------------------------------------------------------------- "
" Display                                                                      "
" ---------------------------------------------------------------------------- "
" Enable true color
 if exists('+termguicolors')
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   set termguicolors
 endif

 " Enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Tabs are 4 spaces for proper files
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" Remove dog trails
set noswapfile
set nobackup
set noundofile

set number  " Add line Numbers
syntax on   " Add syntax highlighting


" ---------------------------------------------------------------------------- "
" Set Color Theme / Display                                                    "
" ---------------------------------------------------------------------------- "
colo glow-in-the-dark-gucci-shark-bites-edit
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE


" ---------------------------------------------------------------------------- "
" Key-Bindings                                                                 "
" ---------------------------------------------------------------------------- "
map <Leader>w <C-w> " Change vim windows with \w
nnoremap <silent> <C-l> :nohl<CR><C-l> " <Ctrl-l> redraws, removing search highlighting.
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> " F5 Removes trailing whitespace 


" ---------------------------------------------------------------------------- "
" Plugin Settings                                                              "
" ---------------------------------------------------------------------------- "
" - youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'  " youcompleteme fix
let g:ycm_enable_diagnostic_signs = 0         " Don't highlight errors
let g:ycm_enable_diagnostic_highlighting = 0  " ^^^

" - Vim Airline 
let g:airline_powerline_fonts = 1
let g:airline_theme='sharkbites' " Used to use 'ouo'
set noshowmode

" - ALE gutter color and symbols
highlight clear SignColumn      " Clear sign
let g:ale_set_highlights = 0    " No ale highlights on line
let g:ale_sign_error = ' x'     " Error symbol
let g:ale_sign_warning = ' *'   " Warning Symbol
highlight ALEErrorSign ctermbg=NONE ctermfg=red 
highlight ALEError guibg=NONE ctermbg=NONE cterm=NONE
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEWarning guibg=NONE ctermbg=NONE cterm=NONE

" - Rainbow Parenthesis
let g:rainbow_active = 1 
let g:guifgs = ['firebrick', 'royalblue3', 'darkorange3', 'seagreen3']