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
hi MatchParen     guifg=#FF8833 guibg=#010517 gui=underline cterm=underline
hi StatusLine     guifg=#f8f8f2 guibg=#1a1a1a gui=bold cterm=bold
hi StatusLineNC   guifg=#555555 guibg=#010517 gui=NONE
hi PMenu          guifg=#BD9800 guibg=#121628 guisp=#121628 gui=NONE ctermfg=222 ctermbg=235 cterm=NONE
hi PMenuSel       guifg=#FDDC87 guibg=#121618 guisp=#121618 gui=NONE ctermfg=15 ctermbg=234 cterm=NONE
hi PMenuThumb     guifg=#32384A guibg=#32384a guisp=#32384a gui=NONE ctermfg=239 ctermbg=239 cterm=NONE
hi PMenuSbar      guifg=#121628 guibg=#121628 guisp=#121628 gui=NONE ctermfg=235 ctermbg=235 cterm=NONE
hi IncSearch      guifg=#f856b5 guibg=#000000 gui=NONE
hi Search         guifg=#00ffff guibg=#010517 gui=NONE
hi Directory      guifg=#7AA1EB guibg=#010517 gui=NONE
hi Folded         guifg=#7AA1EB guibg=#1f1f1f gui=NONE
hi FoldColumn     guifg=#FF8833 guibg=#010517 gui=NONE
hi Normal         guifg=#AAAAAA guibg=#010517 gui=NONE
hi Boolean        guifg=#AAA5B0 guibg=#010517 gui=NONE
hi Character      guifg=#AAA5B0 guibg=#010517 gui=NONE
hi Comment        guifg=#5675b0 guibg=#010517 gui=NONE
hi Conditional    guifg=#7AA1EB guibg=#010517 gui=NONE
hi Repeat         guifg=#7AA1EB guibg=#010517 gui=NONE
hi Constant       guifg=#FF8833 guibg=#010517 gui=NONE
hi define         guifg=#bd9800 guibg=#010517 gui=none
hi DiffAdd        guifg=#f8f8f2 guibg=#468410 gui=bold cterm=bold
hi DiffDelete     guifg=#8b080b guibg=#010517 gui=NONE
hi DiffChange     guifg=#f8f8f2 guibg=#243a5f gui=NONE
hi DiffText       guifg=#f8f8f2 guibg=#204a87 gui=bold cterm=bold
hi Conceal        guifg=#FDDC87 guibg=#010517 gui=NONE
hi ErrorMsg       guifg=#FB8496 guibg=#010517 gui=NONE
hi Error          guifg=#FB8496 guibg=#010517 gui=NONE
hi WarningMsg     guifg=#f8f8f0 guibg=#010517 gui=NONE
hi Float          guifg=#AAA5B0 guibg=#010517 gui=NONE
hi Function       guifg=#FB8496 guibg=#010517 gui=NONE
hi Identifier     guifg=#A6C3F6 guibg=#010517 gui=italic cterm=italic
hi Keyword        guifg=#FDDC87 guibg=#010517 gui=NONE
hi Label          guifg=#FF8833 guibg=#010517 gui=NONE
hi NonText        guifg=#525563 guibg=#010517 gui=NONE
hi Number         guifg=#AAA5B0 guibg=#010517 gui=NONE
hi Operator       guifg=#BD9800 guibg=#010517 gui=NONE
hi PreProc        guifg=#FDDC87 guibg=#010517 gui=NONE
hi Special        guifg=#FDDC87 guibg=#010517 gui=NONE
hi SpecialKey     guifg=#FDDC87 guibg=#1f1f1f gui=NONE
hi Statement      guifg=#FDDC87 guibg=#010517 gui=NONE
hi StorageClass   guifg=#FB8496 guibg=#010517 gui=italic cterm=italic
hi String         guifg=#7AA1EB guibg=#010517 gui=NONE
hi Tag            guifg=#FF8833 guibg=#010517 gui=NONE
hi TabLineFill    guifg=#010517 guibg=#010517 gui=NONE
hi TabLine        guifg=#888888 guibg=#222222 gui=NONE
hi Title          guifg=#7AA1EB guibg=#010517 gui=bold
hi Todo           guifg=#46FF10 guibg=#010517 gui=underline,bold cterm=underline,bold
hi Type           guifg=#7AA1EB guibg=#010517 gui=NONE
hi Underlined     guifg=#ffffff guibg=#010517 gui=underline cterm=underline

hi xmlAttrib            guifg=#FB8496 guibg=#010517 gui=italic cterm=italic
hi xmlEqual             guifg=#FDDC87 guibg=#010517 gui=NONE
hi xmlTagName           guifg=#5eb2f2 guibg=#010517 gui=NONE
hi xmlTag               guifg=#5eb2f2 guibg=#010517 gui=NONE
hi xmlEndTag            guifg=#5eb2f2 guibg=#010517 gui=NONE

hi ALEErrorSign      guifg=#FB8496 guibg=#010517 gui=NONE 
hi ALEError          guifg=#FB8496 guibg=#010517 gui=NONE
hi ALEWarningSign    guifg=#5eb2f2 guibg=#010517 gui=NONE
hi ALEWarning        guibg=NONE ctermbg=NONE cterm=underline

hi! link Sneak Search
"hi Sneak        guifg=#FB8496 guibg=#010517
"hi SneakScope   guifg=#FB8496 guibg=#010517
"hi SneakLabel   guifg=#FB8496 guibg=#010517

hi! CocErrorSign guifg=#FB8496
hi! CocInfoSign guibg=#FDDC87
hi! CocWarningSign guifg=#5eb2f2
