set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "sharkbitesEdit"

hi Cursor         guifg=#1f1f1f guibg=#f8f8f0 gui=NONE
hi Visual         guifg=#ffffff guibg=#2a2a2a gui=NONE
hi CursorLine     guifg=#ffffff guibg=#2a2a2a gui=NONE
hi ColorColumn    guifg=#ffffff guibg=#111111 gui=NONE
hi CursorColumn   guifg=#ffffff guibg=#2a2a2a gui=NONE
hi CursorLineNr   guifg=#5eb2f2 guibg=#000000 gui=NONE cterm=NONE
hi LineNr         guifg=#555555 guibg=#000000 gui=NONE
hi VertSplit      guifg=#000000 guibg=#bd93f9 gui=NONE
hi MatchParen     guifg=#f856b5 guibg=#000000 gui=underline cterm=underline
hi StatusLine     guifg=#f8f8f2 guibg=#1a1a1a gui=bold cterm=bold
hi StatusLineNC   guifg=#555555 guibg=#000000 gui=NONE
hi Pmenu          guifg=#888888 guibg=#111111 gui=NONE
hi PmenuSel       guifg=#5eb2f2 guibg=#111111 gui=NONE
hi IncSearch      guifg=#ff8c00 guibg=#111111 gui=NONE
hi Search         guifg=#00ffff guibg=#444444 gui=NONE
hi Directory      guifg=#fffe58 guibg=#000000 gui=NONE
hi Folded         guifg=#6272a4 guibg=#1f1f1f gui=NONE
hi Normal         guifg=#f8f8f2 guibg=#000000 gui=NONE
hi Boolean        guifg=#bd93f9 guibg=#000000 gui=NONE
hi Character      guifg=#bd93f9 guibg=#000000 gui=NONE
hi Comment        guifg=#666666 guibg=#000000 gui=NONE
hi Conditional    guifg=#f856b5 guibg=#000000 gui=NONE
hi Constant       guifg=#ffffff guibg=#000000 gui=NONE
hi Define         guifg=#f856b5 guibg=#000000 gui=NONE
hi DiffAdd        guifg=#f8f8f2 guibg=#468410 gui=bold cterm=bold
hi DiffDelete     guifg=#8b080b guibg=#000000 gui=NONE
hi DiffChange     guifg=#f8f8f2 guibg=#243a5f gui=NONE
hi DiffText       guifg=#f8f8f2 guibg=#204a87 gui=bold cterm=bold
hi ErrorMsg       guifg=#f856b5 guibg=#000000 gui=NONE
hi WarningMsg     guifg=#f8f8f0 guibg=#000000 gui=NONE
hi Float          guifg=#bd93f9 guibg=#000000 gui=NONE
hi Function       guifg=#56f856 guibg=#000000 gui=NONE
hi Identifier     guifg=#5eb2f2 guibg=#000000 gui=italic cterm=italic
hi Keyword        guifg=#f856b5 guibg=#000000 gui=NONE
hi Label          guifg=#fffe58 guibg=#000000 gui=NONE
hi NonText        guifg=#525563 guibg=#000000 gui=NONE
hi Number         guifg=#bd93f9 guibg=#000000 gui=NONE
hi Operator       guifg=#54f4b4 guibg=#000000 gui=NONE
hi PreProc        guifg=#f856b5 guibg=#000000 gui=NONE
hi Special        guifg=#f8f8f2 guibg=#000000 gui=NONE
hi SpecialKey     guifg=#525563 guibg=#1f1f1f gui=NONE
hi Statement      guifg=#f856b5 guibg=#000000 gui=NONE
hi StorageClass   guifg=#56f856 guibg=#000000 gui=italic cterm=italic
hi String         guifg=#fffe58 guibg=#000000 gui=NONE
hi Tag            guifg=#f856b5 guibg=#000000 gui=NONE
hi TabLineFill    guifg=#000000 guibg=#000000 gui=NONE
hi TabLine        guifg=#888888 guibg=#222222 gui=NONE
hi Title          guifg=#5eb2f2 guibg=#000000 gui=bold
hi Todo           guifg=#6272a4 guibg=#000000 gui=underline,bold cterm=underline,bold
hi Type           guifg=#f856b5 guibg=#000000 gui=NONE
hi Underlined     guifg=#ffffff guibg=#000000 gui=underline cterm=underline

hi jsNoise              guifg=#54F4B4 guibg=#000000 gui=NONE
hi jsNull               guifg=#bd93f9 guibg=#000000 gui=NONE
hi jsxChild             guifg=#54F4B4 guibg=#000000 gui=NONE
hi jsThis               guifg=#F856B5 guibg=#000000 gui=NONE
hi jsImportContainer    guifg=#ffffff guibg=#000000 gui=NONE
hi jsTemplateVar        guifg=#54F4B4 guibg=#000000 gui=NONE
hi jsParen              guifg=#FFFFFF guibg=#000000 gui=NONE
hi jsParens             guifg=#54F4B4 guibg=#000000 gui=NONE
hi jsBlock              guifg=#ffffff guibg=#000000 gui=NONE
hi jsFuncArgs           guifg=#FFFFFF guibg=#000000 gui=NONE
hi jsStorageClass       guifg=#F856B5 guibg=#000000 gui=NONE
hi jsGlobalObjects      guifg=#FFFE58 guibg=#000000 gui=NONE
hi jsClassDefinition    guifg=#56F856 guibg=#000000 gui=NONE
hi jsClassKeywords      guifg=#F856B5 guibg=#000000 gui=NONE
hi jsExportContainer    guifg=#ffffff guibg=#000000 gui=NONE
hi jsArrowFunction      guifg=#F856B5 guibg=#000000 gui=NONE
hi jsLineComment        guifg=#555555 guibg=#000000 gui=italic cterm=italic
hi jsFuncCall           guifg=#5EB2F2 guibg=#000000 gui=NONE
hi jsSuper              guifg=#FFFE58 guibg=#000000 gui=NONE
hi jsObjectKey          guifg=#FFFE58 guibg=#000000 gui=NONE
hi jsDecorator          guifg=#5EB2F2 guibg=#000000 gui=NONE
hi jsDecoratorFunction  guifg=#5EB2F2 guibg=#000000 gui=NONE
hi jsTemplateBraces     guifg=#FFFE58 guibg=#000000 gui=NONE
hi jsModules            guifg=#F856B5 guibg=#000000 gui=NONE
hi jsReturn             guifg=#F856B5 guibg=#000000 gui=NONE
hi jsFuncName           guifg=#FFFFFF guibg=#000000 gui=NONE
hi jsModuleWords        guifg=#F856B5 guibg=#000000 gui=NONE
hi xmlAttrib            guifg=#56F856 guibg=#000000 gui=italic cterm=italic
hi jsFuncBlock          guifg=#FFFFFF guibg=#000000 gui=NONE
hi xmlEqual             guifg=#F856B5 guibg=#000000 gui=NONE
hi xmlTagName           guifg=#5EB2F2 guibg=#000000 gui=NONE
hi xmlTag               guifg=#5EB2F2 guibg=#000000 gui=NONE
hi xmlEndTag            guifg=#5EB2F2 guibg=#000000 gui=NONE

" ALE
"hi clear SignColumn
"NERDTree
"hi Directory guibg=#000000 guifg=#ffffff ctermfg=gray ctermbg=black

