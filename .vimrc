" ---------------------------------------------------------------------------- "
" Vim-Plug                                                                     "
" ---------------------------------------------------------------------------- "
call plug#begin('~/.vim/plugged')
" - Completion
Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 install.py --clang-completer --java-completer' } " youcompleteme
Plug 'prabirshrestha/vim-lsp'                                   " LSP
Plug 'prabirshrestha/async.vim'                                 " Async
Plug 'townk/vim-autoclose'                                      " Autoclose
" - Language
Plug 'sheerun/vim-polyglot'                                     " Vim Polyglot
Plug 'vim-latex/vim-latex'                                      " Latex
Plug 'w0rp/ale'                                                 " ALE
" - Display
Plug 'Yggdroot/indentLine'                                      " indentLine
Plug 'lilydjwg/colorizer'                                       " Color Highlighter
Plug 'luochen1990/rainbow'                                      " Rainbow Parenthesis
Plug 'vim-airline/vim-airline'                                  " Vim-airline
Plug 'voldikss/vim-floaterm'                                    " Floaterm
" - Integrations
Plug '/usr/local/opt/fzf'                                       " FZF
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'                           " Trailing Whitespace
Plug 'tpope/vim-fugitive'                                       " Fugitive
Plug 'tyru/open-browser.vim'                                    " Open Browser
Plug 'vim-pandoc/vim-pandoc'                                    " Pandoc/Markdown
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ludovicchabant/vim-gutentags'
" - Interface
Plug 'airblade/vim-gitgutter'                                   " git-gutter
" - Commands
Plug 'justinmk/vim-sneak'                                       " vim-sneak
Plug 'majutsushi/tagbar'                                        " Tagbar
Plug 'tpope/vim-surround'                                       " Vim-surround
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

" Redirect backups
set undofile
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//
set undodir=$HOME/.vim/undo//

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

set number " Add line Numbers
set numberwidth=3 " 3 for number size
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
"colo glow-in-the-dark-gucci-shark-bites-edit
colo cornell

" Spell Checking Coloring
hi clear SpellBad
hi SpellBad     guifg=#ff4444 gui=undercurl
hi SpellRare    guifg=#ddaaff
hi SpellCap     guifg=#ff8811 cterm=underline


if &term =~ '256color'
    set t_ut=
endif


" ---------------------------------------------------------------------------- "
" Key-Bindings / Commands                                                      "
" ---------------------------------------------------------------------------- "
nnoremap <silent> <C-l> :nohl<CR><C-l> " <Ctrl-l> redraws, removing search highlighting.

" Source vimrc
nnoremap <Leader>v :source ~/.vimrc<CR>

" Escape to jk to leave insert mode
inoremap jk <Esc>
inoremap JK <Esc>
" Enter escapes visual mode
vnoremap <CR> <Esc>

" Change , to ;
nnoremap , ;
vnoremap , ;

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
" Or double tap leader
nnoremap <Leader><Leader> <C-w>w

" Alternate Buffers with <Leader>b
nnoremap <Leader>b :w<CR>:b#<CR>

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

" Fold based on a search pattern
" Use zm to show less and zr to show more
command! -nargs=+ Foldsearch exe "normal /".<q-args>."\r" | setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\|\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=0

" Completion Writing code
command CodeSuggest
    \ let g:acp_behaviorKeywordLength = 2 |
    \ setlocal nospell
    \ pumheight=0
    \ complete=.,w,b,u,t,i
    \ dictionary=
    \ thesaurus= |
    \ DittoOff

" Completion writing english
command DocSuggest
    \ let g:acp_behaviorKeywordLength = 5 |
    \ setlocal spell
    \ complete+=k/usr/share/dict/words
    \ pumheight=3
    \ dictionary+=/usr/share/dict/words
    \ thesaurus+=~/.vim/dict_thes/thes.text |
    \ DittoOn

" Turn on DocSuggest if likely writing prose
if has("autocmd")
    autocmd BufReadPost,BufNewFile *.md,*.txt,*.org DocSuggest
    autocmd BufReadPost,BufNewFile *.txt setlocal linebreak wrap nolist textwidth=0
endif


" ---------------------------------------------------------------------------- "
" Plugin Settings                                                              "
" ---------------------------------------------------------------------------- "

" - ALE
highlight clear SignColumn      " Clear sign

let g:ale_set_highlights = 1    " No ale highlights on line
let g:ale_sign_error = '>>'     " Error symbol
let g:ale_sign_warning = '>>'   " Warning Symbol

let g:airline#extensions#ale#enabled = 1

let g:ale_linter_aliases={'txt': 'text'}
let g:ale_linters={'pandoc': ['languagetool', 'mdl'], 'markdown': ['languagetool', 'mdl'], 'text': ['languagetool'], 'tex': ['chktex']}

highlight ALEErrorSign      ctermbg=NONE ctermfg=red
highlight ALEError          guibg=NONE ctermbg=NONE cterm=underline ctermfg=red
highlight ALEWarningSign    ctermbg=NONE ctermfg=yellow
highlight ALEWarning        guibg=NONE ctermbg=NONE cterm=underline

" - Easytags
let g:easytags_async = 1

" - FZF
nnoremap <leader>f :FZF

" - Floaterm
let g:floaterm_keymap_toggle = '<Leader>sh'
"let g:floaterm_wintype = 'normal'
hi FloatermBorder guifg=orange


" - Git Gutter
highlight GitGutterAdd    guifg=#448844
highlight GitGutterChange guifg=#448888
highlight GitGutterDelete guifg=#884444

" - indent line
let g:indentLine_char = '│'
set fillchars+=vert:│

" - Open Browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>g <Plug>(openbrowser-smart-search)
vmap <Leader>g <Plug>(openbrowser-search)

" - Rainbow Parenthesis
let g:rainbow_active = 1

" - Vim Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='shark_trans'
"let g:airline_powerline_fonts = 0 " No Separators
"let g:airline_left_sep = ''  " No > Sep
let g:airline_right_sep = '' " No < Sep
set noshowmode " Remove default mode display

" - Vim-better-whitespace
nnoremap <Leader><Leader>s :StripWhitespace<Enter>

" - Vim-Latex
let g:tex_flavor='latex'
let g:tex_conceal='abmgs'
let g:livepreview_previewer = 'open -a Skim'
if has("autocmd")
    autocmd BufReadPost,BufNewFile *.tex
        \ setlocal sw=2 spell conceallevel=2 concealcursor=nvc iskeyword+=: textwidth=120
        \ dictionary+=~/.vim/dict_thes/latex.text complete+=k
        \ updatetime=1000 |
        \ IndentLinesDisable |
        \ autocmd CursorHold,CursorHoldI * update
endif

" - vim-sneak
let g:sneak#label = 1


" Load any external config
runtime ocaml-config.vim
runtime swift-config.vim
