set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "cornell"

hi Cursor         guifg=#1f1f1f guibg=#f8f8f0 gui=NONE
hi Visual         guifg=#5eb2f2 guibg=#2a2a2a gui=NONE
hi CursorLine     guibg=#111527 cterm=NONE ctermbg=7 ctermfg=NONE
hi ColorColumn    guifg=#ffffff guibg=#111527 gui=NONE
hi CursorColumn   guifg=#ffffff guibg=#2a2a2a gui=NONE
hi CursorLineNr   guifg=#5eb2f2 guibg=#010517 gui=NONE cterm=NONE
hi LineNr         guifg=#34484A guibg=#010517 gui=NONE
hi VertSplit      guifg=#010517 guibg=#676b7d gui=NONE
hi StatusLine     guifg=#BD9800 guibg=#010517 gui=NONE cterm=NONE
hi StatusLineNC   guifg=#777777 guibg=#010517 gui=NONE cterm=NONE
hi StatusLineTerm   guifg=#FF8833 guibg=#010517 gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#777777 guibg=#010517 gui=NONE cterm=NONE
hi MatchParen     guifg=#FF8833 guibg=#010517 gui=underline cterm=underline
hi Pmenu          guifg=#CCCCCC guibg=#121628
hi PmenuSbar      guifg=#43454b guibg=#121628
hi PmenuSel       guifg=#efffff guibg=#FF8833
hi PmenuThumb     guifg=#34353b guibg=#32384a
hi IncSearch      guifg=#f856b5 guibg=#000000 gui=NONE
hi Search         guifg=#00ffff guibg=#010517 gui=NONE
hi Directory      guifg=#7AA1EB guibg=#010517 gui=NONE
hi Folded         guifg=#7AA1EB guibg=#1f1f1f gui=NONE
hi FoldColumn     guifg=#FF8833 guibg=#010517 gui=NONE
hi Normal         guifg=#AAAAAA guibg=#010517 gui=NONE
hi Boolean        guifg=#DCCC78 guibg=#010517 gui=NONE
hi Character      guifg=#DCCC78 guibg=#010517 gui=NONE
hi Comment        guifg=#5675b0 guibg=#010517 gui=NONE
hi Conditional    guifg=#7AA1EB guibg=#010517 gui=NONE
hi Repeat         guifg=#7AA1EB guibg=#010517 gui=NONE
hi Constant       guifg=#FF8833 guibg=#010517 gui=NONE
hi Define         guifg=#BD9800 guibg=#010517 gui=none
hi DiffAdd        guifg=#f8f8f2 guibg=#1c3300 gui=bold
hi DiffDelete     guifg=#8b080b guibg=#010517 gui=NONE
hi DiffChange     guifg=#f8f8f2 guibg=#243a5f gui=NONE
hi DiffText       guifg=#f8f8f2 guibg=#204a87 gui=bold cterm=bold
hi Conceal        guifg=#FDDC87 guibg=#010517 gui=NONE
hi ErrorMsg       guifg=#FB8496 guibg=#010517 gui=NONE
hi Error          guifg=#FB8496 guibg=#010517 gui=NONE
hi WarningMsg     guifg=#f8f8f0 guibg=#010517 gui=NONE
hi Float          guifg=#AABFE6 guibg=#010517 gui=NONE
hi Function       guifg=#FB8496 guibg=#010517 gui=NONE
hi Identifier     guifg=#A6C3F6 guibg=#010517 gui=italic cterm=italic
hi Keyword        guifg=#FDDC87 guibg=#010517 gui=NONE
hi Label          guifg=#FF8833 guibg=#010517 gui=NONE
hi NonText        guifg=#DCCC78 guibg=#010517 gui=NONE
hi Number         guifg=#DCCC78 guibg=#010517 gui=NONE
hi Operator       guifg=#BD9800 guibg=#010517 gui=NONE
hi PreProc        guifg=#FDDC87 guibg=#010517 gui=NONE
hi Special        guifg=#FDDC87 guibg=#010517 gui=NONE
hi SpecialKey     guifg=#FDDC87 guibg=#1f1f1f gui=NONE
hi Statement      guifg=#FDDC87 guibg=#010517 gui=NONE
hi StorageClass   guifg=#FB8496 guibg=#010517 gui=italic cterm=italic
hi String         guifg=#7AA1EB guibg=#010517 gui=NONE
hi Tag            guifg=#FF8833 guibg=#010517 gui=NONE
hi TabLine        guifg=#888888 guibg=#010517 gui=NONE
hi TabLineFill    guifg=#000103 guibg=#010517 gui=NONE
hi TabLineSel     guifg=#7AA1EB guibg=#010517 gui=NONE
hi Title          guifg=#7AA1EB guibg=#010517 gui=bold
hi Todo           guifg=#FF7700 guibg=#010517 gui=underline,bold cterm=underline,bold
hi Type           guifg=#7AA1EB guibg=#010517 gui=NONE
hi Underlined     guifg=#ffffff guibg=#010517 gui=underline cterm=underline

hi xmlAttrib            guifg=#FB8496 guibg=#010517 gui=italic cterm=italic
hi xmlEqual             guifg=#FDDC87 guibg=#010517 gui=NONE
hi xmlTagName           guifg=#5eb2f2 guibg=#010517 gui=NONE
hi xmlTag               guifg=#5eb2f2 guibg=#010517 gui=NONE
hi xmlEndTag            guifg=#5eb2f2 guibg=#010517 gui=NONE

hi pythonBuiltinObj         guifg=#FDDC87 guibg=NONE  gui=NONE
hi pythonBuiltinType        guifg=#7AA1EB guibg=#010517 gui=NONE
hi pythonClassVar           guifg=#FF8833 guibg=NONE  gui=NONE
hi pythonDecorator          guifg=#FF8833 guibg=NONE  gui=NONE
hi pythonDottedName         guifg=#FF8833 guibg=NONE  gui=NONE
hi pythonExClass            guifg=#7AA1EB guibg=NONE  gui=NONE
hi pythonException          guifg=#FB8496 guibg=NONE  gui=NONE
hi pythonFunction           guifg=#7AA1EB guibg=NONE  gui=NONE
hi pythonImport             guifg=#FB8496 guibg=NONE  gui=NONE
hi pythonNumber             guifg=#AABFE6 guibg=NONE  gui=NONE
hi pythonOperator           guifg=#7AA1EB guibg=NONE  gui=NONE
hi pythonStatement          guifg=#FFCC66 guibg=NONE  gui=NONE
hi pythonStrInterpRegion    guifg=#7AA1EB guibg=NONE  gui=NONE
hi pythonTodo               guifg=#46FF10 guibg=NONE  gui=NONE

hi goBuiltins           guifg=#FDDC87 guibg=NONE gui=NONE
hi goConditional        guifg=#7AA1EB guibg=NONE gui=NONE
hi goConstants          guifg=#FF8833 guibg=NONE gui=NONE
hi goConst              guifg=#7AA1EB guibg=NONE gui=NONE
hi goDeclType           guifg=#FDDC87 guibg=NONE gui=NONE
hi goDeclaration        guifg=#FDDC87 guibg=NONE gui=NONE
hi goDirective          guifg=#AABFE6 guibg=NONE gui=NONE
hi goImport             guifg=#FB8496 guibg=NONE gui=NONE
hi goLabel              guifg=#FB8496 guibg=NONE gui=NONE
hi goPackage            guifg=#FB8496 guibg=NONE gui=NONE
hi goSignedInts         guifg=#AABFE6 guibg=NONE gui=NONE
hi goStatement          guifg=#AABFE6 guibg=NONE gui=NONE
hi goTodo               guifg=#46FF10 guibg=NONE gui=NONE
hi goType               guifg=#AABFE6 guibg=NONE gui=NONE
hi goUnsignedInts       guifg=#AABFE6 guibg=NONE gui=NONE
hi goVar                guifg=#7AA1EB guibg=NONE gui=NONE

" ALE
hi ALEErrorSign      guifg=#FB8496 guibg=#010517 gui=NONE
hi ALEError          guifg=#FB8496 guibg=#010517 gui=NONE
hi ALEWarningSign    guifg=#5eb2f2 guibg=#010517 gui=NONE
hi ALEWarning        guibg=NONE ctermbg=NONE cterm=underline

" Coc
hi CocErrorSign         guifg=#FB8496
hi CocInfoSign          guifg=#FDDC87
hi CocWarningSign       guifg=#5eb2f2
hi CocHighlightText     guifg=#ddffff guibg=#333333

hi ModeMsg guifg=#AABFE6 guibg=NONE
