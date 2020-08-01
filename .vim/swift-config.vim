
" Swift line length
if has("autocmd")
    autocmd BufReadPost,BufNewFile *.swift set textwidth=120 tabstop =4 softtabstop=4 shiftwidth=4
endif

" Configure Swift LSP

"let s:sourcekit_path = string(system('xcrun --find sourcekit-lsp'))
" if executable(s:sourcekit_path)
"if executable('/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'sourcekit_path',
"        \ 'cmd': {server_info->['/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp']},
"        \ 'whitelist': ['swift'],
"        \ })
"endif
"
" Use Lsp for omni completion
"autocmd FileType swift setlocal omnifunc=lsp#complete
