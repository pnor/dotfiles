" ---------------------------------------------------------------------------- "
" Vim-Plug                                                                     "
" ---------------------------------------------------------------------------- "
call plug#begin('~/.vim/plugged')

" - Completion
Plug 'ajh17/vimcompletesme'                                     " Vim-Completes-me
Plug 'https://github.com/pnor/AutoComplPop.git'                 " Auto Completion Prompt
Plug 'townk/vim-autoclose'                                      " Autoclose
" - Language
Plug 'sheerun/vim-polyglot'                                     " Vim Polyglot
Plug 'vim-latex/vim-latex'                                      " Latex
Plug 'w0rp/ale'                                                 " ALE
" - Display
Plug 'Yggdroot/indentLine'                                      " indentLine
Plug 'luochen1990/rainbow'                                      " Rainbow Parenthesis
Plug 'vim-airline/vim-airline'                                  " Vim-airline
" - Integrations
Plug '/usr/local/opt/fzf'                                       " FZF
Plug 'jceb/vim-orgmode'                                         " Org-Mode
Plug 'ntpeters/vim-better-whitespace'                           " Trailing Whitespace
Plug 'tpope/vim-fugitive'                                       " Fugitive
" - Interface
Plug 'airblade/vim-gitgutter'
" - Commands
Plug 'easymotion/vim-easymotion'                                " Easy Motion
Plug 'scrooloose/nerdcommenter'                                 " NERD Commenting

" - Color Themes
Plug 'NLKNguyen/papercolor-theme'                               " Papercolor
Plug 'fcpg/vim-orbital'                                         " Orbital
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'        " Sharkbites Airline Theme

" - Misc
Plug 'dbmrq/vim-ditto'                                          " Ditto
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }          " Latex Preview

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

if has("autocmd")
    " Remember Last cursor location
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"zz" | endif
endif

if has("autocmd")
    autocmd BufReadPost,BufNewFile *.swift set textwidth=120
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
set numberwidth=3 " 3 for numnber size
"set relativenumber " Use relative number to make it easy to jump
syntax on   " Add syntax highlighting

" :find works as file fuzzy finder
set path+=**
set wildmenu

" Line for over 80 characters
set textwidth=80
set colorcolumn=+0


" ---------------------------------------------------------------------------- "
" Set Color Theme / Display                                                    "
" ---------------------------------------------------------------------------- "
colo glow-in-the-dark-gucci-shark-bites-edit

" Spell Checking Coloring
hi clear SpellBad
hi SpellBad     guifg=#ff4444 gui=undercurl
hi SpellRare    guifg=#ddaaff
hi SpellCap     guifg=#ff8811 cterm=underline


if &term =~ '256color'
    set t_ut=
endif


" ---------------------------------------------------------------------------- "
" Key-Bindings                                                                 "
" ---------------------------------------------------------------------------- "
nnoremap <silent> <C-l> :nohl<CR><C-l> " <Ctrl-l> redraws, removing search highlighting.

" Escape to jk to leave insert mode
inoremap jk <Esc>
" Enter escapes visual mode
vnoremap <CR> <Esc>

" Map ; to :
map ; :

" Brace completion
inoremap {<Enter> {<Enter><Enter>}<Esc>ki<Tab>

" Ctrl-W to Leader W to navigate splits
nnoremap <Leader>w <C-w>w
nnoremap <Leader>W <C-w>W
tnoremap <Leader>w <C-w>w
tnoremap \w <C-w>w
tnoremap \W <C-w>W

" Map spacebar to leader
map <Space> <Leader>

" Fix spelling errors
imap *L <Esc>[s1z=`]a

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
" Completion suggestions for  writing code
command CodeSuggest
    \ let g:acp_behaviorKeywordLength = 2 |
    \ setlocal nospell
    \ pumheight=0
    \ complete=.,w,b,u,t,i
    \ dictionary=
    \ thesaurus= |
    \ DittoOff
" Completion suggestions for better documentation/text
command DocSuggest
    \ let g:acp_behaviorKeywordLength = 5 |
    \ setlocal spell
    \ complete+=k/usr/share/dict/words
    \ pumheight=3
    \ dictionary+=/usr/share/dict/words
    \ thesaurus+=~/.vim/dict_thes/thes.text |
    \ DittoOn

if has("autocmd")
    autocmd BufReadPost,BufNewFile *.md,*.txt DocSuggest
    autocmd BufReadPost,BufNewFile *.txt setlocal linebreak wrap nolist textwidth=0
endif


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
nnoremap <leader>f :FZF

" - Git Gutter
highlight GitGutterAdd    guifg=#448844
highlight GitGutterChange guifg=#448888
highlight GitGutterDelete guifg=#884444

" - LanguageTool
let g:ale_languagetool_executable='languagetool'
let g:ale_linter_aliases={'txt': 'text'}
let g:ale_linters={'markdown': ['languagetool', 'mdl'], 'text': ['languagetool'], 'tex': ['chktex']}

" - Rainbow Parenthesis
let g:rainbow_active = 1
let g:guifgs = ['firebrick', 'royalblue3', 'darkorange3', 'seagreen3']


" - Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='shark_trans'
" No > Sep
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
set noshowmode

" - Vim-better-whitespace
nnoremap <Leader>s :StripWhitespace<Enter>

" - Vim-Latex
"Set up latex preferences
let g:tex_flavor='latex'
let g:tex_conceal='abmgs'
let g:livepreview_previewer = 'open -a Preview'
if has("autocmd")
    autocmd BufReadPost,BufNewFile *.tex
        \ setlocal sw=2
        \ spell
        \ concealcursor=nvc
        \ dictionary+=~/.vim/dict_thes/latex.text
        \ complete+=k
        \ iskeyword+=:
        \ updatetime=1000
endif

" - Vim-orgmode
" Stop trying to ask me to install SpeedDating
command -nargs=* -range SpeedDatingFormat


" Load any external config
runtime ocaml-config.vim
