set guifont=MesloLGSNerdFontComplete-Regular:h14
set background=light
colorscheme PaperColor
AirlineTheme transparent

if has("gui_macvim")
    " Setup TouchBar Menu
    amenu TouchBar.DocSuggest :DocSuggest<Cr>
    amenu TouchBar.CodeSuggest :CodeSuggest<Cr>
endif

