" ---------------------------------------------------------------------------- "
" Vim-Plug                                                                     "
" ---------------------------------------------------------------------------- "
call plug#begin('~/.vim/plugged')

" - Completion
Plug 'ervandew/supertab'
Plug 'vim-scripts/AutoComplPop', { 'on': 'UseAllPlugs' }        " Auto Completion Prompt TODO select first option
" - Handy
Plug 'easymotion/vim-easymotion'                                " Easy Motion
Plug 'ntpeters/vim-better-whitespace'                           " Trailing Whitespace
Plug 'townk/vim-autoclose'                                      " Autoclose
Plug '/usr/local/opt/fzf', { 'on': 'UseAllPlugs' }              " FZF
Plug 'scrooloose/nerdcommenter', { 'on': 'UseAllPlugs' }        " NERD Commenting
Plug 'tpope/vim-fugitive', { 'on': 'UseAllPlugs' }              " Fugitive
Plug 'w0rp/ale', { 'on': 'UseAllPlugs' }                        " ALE
" - Appearence
Plug 'Yggdroot/indentLine'                                      " indentLine
Plug 'luochen1990/rainbow'                                      " Rainbow Parenthesis
Plug 'sheerun/vim-polyglot'                                     " Vim Polyglot
Plug 'vim-airline/vim-airline' , { 'on': 'UseAllPlugs' }        " Vim-airline
" - Color Themes
Plug 'NLKNguyen/papercolor-theme'                               " Papercolor
Plug 'fcpg/vim-orbital'                                         " Orbital
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'        " Sharkbites Airline Theme

Plug 'ryanoasis/vim-devicons', { 'on': 'UseAllPlugs' }          " Dev icons (Must be called last)
call plug#end()


" Handling whether it was started with "UseAllPlugs" arguement
function ShouldUseAllPlugs()
    return len(v:argv) >= 3 && v:argv[2] =~ 'UseAllPlugs'
endfunction


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

" Remove dog trails
set noswapfile
set nobackup
set noundofile

" ins-completion
set completeopt=menuone,longest,preview


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

set number  " Add line Numbers
syntax on   " Add syntax highlighting


" ---------------------------------------------------------------------------- "
" Set Color Theme / Display                                                    "
" ---------------------------------------------------------------------------- "
if ShouldUseAllPlugs()
    colo glow-in-the-dark-gucci-shark-bites-edit " Loaded all plugins
else
    colo orbital " Loaded minimal plugins
endif

if &term =~ '256color'
    set t_ut=
endif


" ---------------------------------------------------------------------------- "
" Key-Bindings                                                                 "
" ---------------------------------------------------------------------------- "
nnoremap <silent> <C-l> :nohl<CR><C-l> " <Ctrl-l> redraws, removing search highlighting.

" Escape to jk to leave insert mode
inoremap jk <Esc>

" Map ; to :
map ; :

" Complete Brackets
" inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" Ctrl-W to Leader W
nnoremap <Leader>w <C-w>w
nnoremap <Leader>W <C-w>W
tnoremap <Leader>w <C-w>w


" Map spacebar to leader
map <Space> <Leader>

" Move Faster with arrows
nnoremap <Up> 8k
nnoremap <Down> 8j
nnoremap <Right> 5l
nnoremap <Left> 5h


" ---------------------------------------------------------------------------- "
" Plugin Settings                                                              "
" ---------------------------------------------------------------------------- "

" - Aucomplete & Supertab
let g:acp_behaviorKeywordLength = 1
let g:SuperTabLongestHighlight = 1
let g:acp_behaviorKeywordCommand = "\<C-p>"

" - ALE gutter color and symbols
highlight clear SignColumn      " Clear sign
let g:ale_set_highlights = 1    " No ale highlights on line
let g:ale_sign_error = '>>'     " Error symbol
let g:ale_sign_warning = '>>'   " Warning Symbol
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEError guibg=NONE ctermbg=NONE cterm=underline ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEWarning guibg=NONE ctermbg=NONE cterm=underline
let g:airline#extensions#ale#enabled = 1

" - Easymotion
nmap s <Plug>(easymotion-s2)

" - Fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" - FZF
nnoremap <leader>t :FZF

" - Rainbow Parenthesis
let g:rainbow_active = 1
let g:guifgs = ['firebrick', 'royalblue3', 'darkorange3', 'seagreen3']

" - Vim Airline
if ShouldUseAllPlugs() " Loaded all plugins
    let g:airline_powerline_fonts = 1
    let g:airline_theme='sharkbites'
    let g:airline#extensions#ycm#enabled = 1
    " No > Sep
    let g:airline_powerline_fonts = 0
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    set noshowmode
else
    set laststatus=2
    set statusline+=%F
endif

" Load any external config
if ShouldUseAllPlugs() " Loaded all plugins
    runtime ocaml-config.vim
endif
