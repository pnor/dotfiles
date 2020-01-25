" ---------------------------------------------------------------------------- "
" Vim-Plug                                                                     "
" ---------------------------------------------------------------------------- "
call plug#begin('~/.vim/plugged')

" - Completion
Plug 'ajh17/vimcompletesme'
Plug 'https://github.com/pnor/AutoComplPop.git'                 " Auto Completion Prompt
" - Handy
Plug '/usr/local/opt/fzf'                                       " FZF
Plug 'easymotion/vim-easymotion'                                " Easy Motion
Plug 'ntpeters/vim-better-whitespace'                           " Trailing Whitespace
Plug 'scrooloose/nerdcommenter'                                 " NERD Commenting
Plug 'townk/vim-autoclose'                                      " Autoclose
Plug 'tpope/vim-fugitive'                                       " Fugitive
Plug 'w0rp/ale'                                                 " ALE
" - Appearence
Plug 'Yggdroot/indentLine'                                      " indentLine
Plug 'luochen1990/rainbow'                                      " Rainbow Parenthesis
Plug 'sheerun/vim-polyglot'                                     " Vim Polyglot
Plug 'vim-airline/vim-airline'                                  " Vim-airline
" - Color Themes
Plug 'NLKNguyen/papercolor-theme'                               " Papercolor
Plug 'fcpg/vim-orbital'                                         " Orbital
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'        " Sharkbites Airline Theme

Plug 'ryanoasis/vim-devicons'                                   " Dev icons (Must be called last)
call plug#end()


" ---------------------------------------------------------------------------- "
" Config                                                                       "
" ---------------------------------------------------------------------------- "
set nocompatible

" Search
set hlsearch
set incsearch

" Tabs are 4 spaces for proper files
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" Filetype config
filetype plugin indent on

" Remove dog trails
set noswapfile
set nobackup
set noundofile

" ins-completion
set completeopt=menuone,longest,preview

" backspace can delete whitespace/break indents
set backspace=indent,eol,start

" Load matchit so % matches if-else-endif
runtime! macros/matchit.vim

" Spell Checking
if has("autocmd")
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown,txt set dictionary+=/usr/share/dict/words
endif
hi SpellBad cterm=underline
hi clear SpellBad

if has("autocmd")
    " Remember Last cursor location
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"zz" | endif
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

set number  " Add line Numbers
set relativenumber " Use relative number to make it easy to jump
syntax on   " Add syntax highlighting

" :find works as file fuzzy finder
set path+=**
set wildmenu

" Line for over 80 characters
set textwidth=80


" ---------------------------------------------------------------------------- "
" Set Color Theme / Display                                                    "
" ---------------------------------------------------------------------------- "
colo glow-in-the-dark-gucci-shark-bites-edit

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

" Brace completion
inoremap {<Enter> {<Enter><Enter>}<Esc>ki<Tab>

" Ctrl-W to Leader W
nnoremap <Leader>w <C-w>w
nnoremap <Leader>W <C-w>W
tnoremap <Leader>w <C-w>w

" Map spacebar to leader
map <Space> <Leader>

" Move Faster with arrows
nnoremap <Up> 8k
vnoremap <Up> 4k
nnoremap <Down> 8j
vnoremap <Down> 4j
nnoremap <Right> 4l
nnoremap <Left> 4h


" ---------------------------------------------------------------------------- "
" Plugin Settings                                                              "
" ---------------------------------------------------------------------------- "

" - Aucomplete & Supertab
let g:acp_behaviorKeywordLength = 2
let g:acp_autoselectFirstCompletion = 0
" Give spelling suggestions on text docs for long words
autocmd FileType markdown,txt let g:acp_behaviorKeywordLength = 6
" Enter Spelling suggestion versus normal suggestions at will
command CodeSuggest let g:acp_behaviorKeywordLength = 2 | set dictionary=
command DocSuggest let g:acp_behaviorKeywordLength = 6 | set dictionary+=/usr/share/dict/words

" - ALE gutter color and symbols
highlight clear SignColumn      " Clear sign
let g:ale_set_highlights = 1    " No ale highlights on line
let g:ale_sign_error = '>>'     " Error symbol
let g:ale_sign_warning = '~~'   " Warning Symbol
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
nnoremap <leader>f :FZF

" - Rainbow Parenthesis
let g:rainbow_active = 1
let g:guifgs = ['firebrick', 'royalblue3', 'darkorange3', 'seagreen3']

" - Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='sharkbites'
let g:airline#extensions#ycm#enabled = 1
" No > Sep
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
set noshowmode

" Load any external config
runtime ocaml-config.vim
