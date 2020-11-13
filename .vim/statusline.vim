" Functions for Statusline
function CurrentGitStatus() " Gets the current git status for the statusline
    let b:gitstatus = FugitiveStatusline()
    let b:gitstatus = b:gitstatus[4:-2]
endfunc

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  hi! link CocStatusLine StatusLine

  if empty(info) | return '' | endif
  let msgs = []


  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
    hi! link CocStatusLine CocWarningSign
  endif

  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
    hi! link CocStatusLine CocErrorSign
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction


autocmd BufEnter,BufWritePost * call CurrentGitStatus()
autocmd FileType netrw call CurrentGitStatus()

" Statusline colors
hi! link StatusLineGit Function
hi! link StatusLineBufferNr PmenuSel

" Building the Statusline itself
set laststatus=2

set statusline=
set statusline +=%#StatusLineBufferNr#\ %n\ %*   " buffer number
set statusline +=\ %<%f%*   " file
set statusline +=%m%r%w%q%*     " modified flag
set statusline +=%#StatusLineGit#\ \ %(%{b:gitstatus}%)\ %* " git branch
set statusline +=%=
set statusline +=\ %{&ff}%*  " file format
set statusline +=%y%*   " file type
set statusline +=%5l%*  " current line
set statusline +=/%L\ \ %*  " total lines
set statusline +=%#CocStatusLine#%{StatusDiagnostic()}\ %* "Coc Diagonstics"
