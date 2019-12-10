" ---------------------------------------------------------------------------- "
" Vim-Plug                                                                     "
" ---------------------------------------------------------------------------- "
call plug#begin('~/.vim/plugged')

" - Functionality
Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 install.py --clang-completer --java-completer' }                                                     " youcompleteme
Plug 'easymotion/vim-easymotion'                            " Easy Motion
Plug '/usr/local/opt/fzf', { 'on': 'UseAllPlugs' }          " FZF
Plug 'ntpeters/vim-better-whitespace'                       " Traiing Whitespace
Plug 'scrooloose/nerdcommenter', { 'on': 'UseAllPlugs' }    " NERD Commenting
Plug 'tpope/vim-fugitive', { 'on': 'UseAllPlugs' }          " Fugitive
Plug 'w0rp/ale', { 'on': 'UseAllPlugs' }                    " ALE
" - Appearence
Plug 'Yggdroot/indentLine'                                  " indentLine
Plug 'keith/swift.vim'                                      " Swift Syntax Support
Plug 'luochen1990/rainbow'                                  " Rainbow Parenthesis
Plug 'vim-airline/vim-airline'                              " Vim-airline
Plug 'vim-airline/vim-airline-themes'                       " Vim-airline Themes
" - ColorThemes
Plug 'NLKNguyen/papercolor-theme'                           " Papercolor
Plug 'cocopon/iceberg.vim'                                  " Iceberg Theme
Plug 'fcpg/vim-orbital'                                     " Orbital Theme
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'    " Sharkbites Airline Theme

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

" Spell Checking
autocmd FileType markdown setlocal spell
hi SpellBad cterm=underline
hi clear SpellBad

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
if len(v:argv) >= 3 && v:argv[2] =~ 'c'
    colo glow-in-the-dark-gucci-shark-bites-edit " Loaded all plugins
else
    colo orbital " Loaded minimal plugins
endif

" Keep Black Terminal Background
hi  Normal       guibg=NONE ctermbg=NONE ctermfg=NONE
hi  NonText      cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
hi  StatusLine   cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#ffffff guifg=#d70000
hi  LineNr       guibg=NONE


" ---------------------------------------------------------------------------- "
" Key-Bindings                                                                 "
" ---------------------------------------------------------------------------- "
nnoremap <silent> <C-l> :nohl<CR><C-l> " <Ctrl-l> redraws, removing search highlighting.

" Map ctrl-s to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>l
vnoremap <C-s> <Esc>:w<CR>

" Escape to jk to leave insert mode
inoremap jk <Esc>

" Map ; to :
map ; :

 " Autoclose Parenthesis
inoremap ( ()<Esc>i
inoremap { {}<Esc>i

" Move Faster with arrows
nnoremap <Up> {
nnoremap <Down> }
nnoremap <Right> 5l
nnoremap <Left> 5h


" ---------------------------------------------------------------------------- "
" Plugin Settings                                                              "
" ---------------------------------------------------------------------------- "
" - youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'  " youcompleteme fix
let g:ycm_enable_diagnostic_signs = 0         " Don't highlight errors
let g:ycm_enable_diagnostic_highlighting = 0  " ^^^
if !(len(v:argv) >= 3 && v:argv[2] =~ "c")
    let g:loaded_youcompleteme = 1 " Disable YCM if started without some plugins
endif

" - Easymotion
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)

" - Vim Airline
let g:airline_powerline_fonts = 1
if len(v:argv) >= 3 && v:argv[2] =~ "c"
    let g:airline_theme='sharkbites'    " Loaded all plugins
else
    let g:airline_theme='orbital'       " Loaded minimal plugins
endif
set noshowmode

" - ALE gutter color and symbols
highlight clear SignColumn      " Clear sign
let g:ale_set_highlights = 0    " No ale highlights on line
let g:ale_sign_error = 'x'     " Error symbol
let g:ale_sign_warning = '*'   " Warning Symbol
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEError guibg=NONE ctermbg=NONE cterm=NONE
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEWarning guibg=NONE ctermbg=NONE cterm=NONE
let g:airline#extensions#ale#enabled = 1

" - Fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" - Rainbow Parenthesis
let g:rainbow_active = 1
let g:guifgs = ['firebrick', 'royalblue3', 'darkorange3', 'seagreen3']

"- Easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" - FZF
nnoremap <leader>t :FZF

