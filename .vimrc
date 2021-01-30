" ---------------------------------------------------------------------------- "
" Vim-Plug                                                                     "
" ---------------------------------------------------------------------------- "
call plug#begin('~/.vim/plugged')
" - Completion
Plug 'townk/vim-autoclose'                                      " Autoclose Parens
" - Language
Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Coc
Plug 'sheerun/vim-polyglot'                                     " Language support
Plug 'w0rp/ale'                                                 " ALE
" - Display
Plug 'junegunn/rainbow_parentheses.vim'                         " Rainbow Parenthesis
Plug 'markonm/traces.vim'                                       " Live Pattern Substituion
Plug 'romainl/vim-cool'                                         " Clear search on move
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }       " Color Highlighter
" - Integrations
Plug 'jceb/vim-orgmode'                                         " Org-mode Support
Plug 'jpalardy/vim-slime'                                       " Emacs slime
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " FZF
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'                             " Tag Management
Plug 'ntpeters/vim-better-whitespace'                           " Show Trailing Whitespace
Plug 'tpope/vim-fugitive'                                       " Git Fugitive
Plug 'tyru/open-browser.vim'                                    " Search Web browser
Plug 'vim-pandoc/vim-pandoc'                                    " Pandoc/Markdown Support
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'voldikss/vim-floaterm'                                    " Floaterm
" - Interface
Plug 'airblade/vim-gitgutter'                                   " git-gutter
Plug 'ryanoasis/vim-devicons'                                   " Fancy icons
" - Commands
Plug 'justinmk/vim-sneak'                                       " vim-sneak
Plug 'tpope/vim-surround'                                       " vim-surround
" - Other
Plug 'unblevable/quick-scope'                                   " Highlight unique f/F characters
" - Latex
Plug 'lervag/vimtex'                                            " Vimtex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }          " Latex live preview

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

" Search ignores case unless you use uppercase
set smartcase
set ignorecase

" Filetype configs
filetype plugin indent on

" Redirect backups
set undofile
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//
set undodir=$HOME/.vim/undo//

" ins-completion
set completeopt=menuone,longest,preview

" Show a max of 5 options when the popup menu opens
set pumheight=5

" backspace can delete whitespace/break indents
set backspace=indent,eol,start

" When diffing files, show them vertical side by side
set diffopt+=vertical

" Load matchit so % matches if-else-endif, and related
runtime! macros/matchit.vim

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

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Source color scheme
colo cornell

 " Enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set number " Add line Numbers
set numberwidth=3 " 3 for number size
syntax on   " Add syntax highlighting

" Always have 4 lines of context for cursor
set scrolloff=4

" :find works as file fuzzy finder
set path+=&pwd,src/**,config/**
set wildmenu

" Line for over 110 characters
set textwidth=116
set colorcolumn=+0

" Cursor Line coloring
set cursorline

" Spell Checking Coloring
hi clear SpellBad
hi SpellBad     guifg=#ff5555 gui=undercurl
hi SpellRare    guifg=#ff88cc
hi SpellCap     guifg=#ff8811 cterm=underline

" Solid Split Line
set fillchars=vert:│,stlnc:_,stl:\ ,fold:-,diff:-

" Character for broken lines
set showbreak="+++"

" Show cmd as typed
set showcmd

" statusline
set laststatus=2
runtime statusline.vim


" ---------------------------------------------------------------------------- "
" Key-Bindings / Commands                                                      "
" ---------------------------------------------------------------------------- "
" <Ctrl-l> redraws, removing search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l> 

" Source vimrc
nnoremap <Leader>v :source ~/.vimrc<CR>

" Escape to jk to leave insert mode
inoremap jk <Esc>
inoremap JK <Esc>

" Enter escapes visual mode
vnoremap <CR> <Esc>

" Change , to ;
noremap , ;
vnoremap , ;

" Map ; to :
map ; :

" Brace completion
inoremap {<CR> {<CR>}<ESC>O

" Fix spelling errors
imap *L <Esc>[s1z=`]a

" Use Spacebar for window navigation
nmap <Space> <C-w>

" Move Faster with arrows
nnoremap <Up> 10k
vnoremap <Up> 5k
nnoremap <Down> 10j
vnoremap <Down> 5j
nnoremap <Right> 4l
nnoremap <Left> 4h

" Completion Writing code
command CodeSuggest
    \ setlocal nospell
    \ pumheight=0
    \ complete=.,w,b,u,t,i
    \ dictionary=
    \ thesaurus=

" Completion writing english
command DocSuggest
    \ setlocal spell
    \ complete+=k/usr/share/dict/words
    \ pumheight=5
    \ dictionary+=/usr/share/dict/words
    \ thesaurus+=~/.vim/dict_thes/thes.text

" Open a VSCode-Style File Explorer Sidebar
command Fexplore
    \ execute "let g:netrw_liststyle = 3" |
    \ execute "let g:netrw_browse_split = 4" |
    \ execute "Vexplore" |
    \ execute "normal! <C-w>55<<C-w>w"

" Fold based on a search pattern
command -nargs=+ Foldsearch exe "normal /".<q-args>."\r" | setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\|\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=0

" Compare branch against master for PR reviews
command PRReview execute "Gdiff master"

" Change gitgutter to diff differences from a specific commit hash, and change appearence
command -nargs=1 PRGutter execute
            \ "let g:gitgutter_diff_base=\"<args>\"" |
            \ hi GitGutterAdd       guifg=#44AA44 guibg=#44AA44 |
            \ hi GitGutterChange    guifg=#44AAAA guibg=#44AAAA |
            \ hi GitGutterDelete    guifg=#AA4444 guibg=#AA4444

" Open a Terminal Sidebar
command STerm execute "topleft vert term" | execute "normal! <C-w>N" | execute "vertical resize 40"

" Create a "*scratch*" buffer in a small horizontal split
command Scratch execute "new *scratch*"  | execute "resize 8" | execute "setlocal buftype=nofile"
" and map it to <Space>x
nnoremap <Space>x :Scratch<CR>

" Turn on DocSuggest if writing prose
if has("autocmd")
    autocmd BufReadPost,BufNewFile *.md,*.txt,*.org DocSuggest
    autocmd BufReadPost,BufNewFile *.txt setlocal linebreak wrap nolist textwidth=0
    autocmd BuFReadPost *COMMIT_EDITMSG DocSuggest
endif


" ---------------------------------------------------------------------------- "
" Plugin Settings                                                              "
" ---------------------------------------------------------------------------- "
" - ALE
nnoremap <Leader>n :ALENext<CR>
nnoremap <Leader>p :ALEPrevious<CR>
highlight clear SignColumn      " Clear sign

let g:ale_set_highlights = 1    " No ale highlights on line
let g:ale_sign_error = '#'      " Error symbol
let g:ale_sign_warning = '~'    " Warning Symbol

" - FZF
" Us rg with fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor,venv,__pycache__}/*"'
" Color preview
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4"
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" Maps for fzf
nnoremap <Space><Space> :Files<CR>
nnoremap <Space>b :Buffers<CR>

" - Git Gutter
if has("autocmd")
    hi GitGutterAdd    guifg=#448844
    hi GitGutterChange guifg=#448888
    hi GitGutterDelete guifg=#884444
    autocmd ColorScheme * hi GitGutterAdd    guifg=#448844
    autocmd ColorScheme * hi GitGutterChange guifg=#448888
    autocmd ColorScheme * hi GitGutterDelete guifg=#884444
endif

" - Gutentags
" Generate extra info for tags
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

" - Open Browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>g <Plug>(openbrowser-smart-search)
nnoremap <Leader><Leader>g :OpenBrowserSmartSearch<Space>
vmap <Leader>g <Plug>(openbrowser-search)

" - Rainbow Parenthesis
autocmd VimEnter * RainbowParentheses

" - Vim-better-whitespace
nnoremap <Leader><Leader>s :StripWhitespace<Enter>
let g:better_whitespace_ctermcolor = 'cyan'
let g:better_whitespace_guicolor = '#676b7d'

" - Vim Cool
" show number of matches in the command-line
let g:CoolTotalMatches = 1

" - Vim Floaterm
let g:floaterm_autoclose = 2
let g:floaterm_position='bottomright'
nnoremap <Leader>s :FloatermNew<CR>
hi link Floaterm Type

" - Vim-hexokinase
let g:Hexokinase_highlighters = ['foregroundfull']

" - Vim-orgmode
command -nargs=* -range SpeedDatingFormat

" - Vim-slime
let g:slime_target = "vimterminal"
vnoremap gr :SlimeSend<CR>

" - vim-sneak
let g:sneak#label = 1
hi! link Sneak Search

" - Vimtex
let g:tex_flavor = 'latex'

" - Latex live preview
let g:livepreview_previewer = 'open -a Skim'

" - Quickscope
let g:qs_second_highlight = 0
highlight QuickScopePrimary cterm=bold gui=bold

" Load any external config
runtime coc-config.vim
