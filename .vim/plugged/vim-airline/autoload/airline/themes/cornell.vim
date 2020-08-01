" Based on the airline theme distinguished, used a structural starting point
"

let s:gray     = [245, '#4f5d6a']
let s:darkgray = [245, '#1d1f21']
let s:golden   = [143, '#FDDC87']
let s:blue     = [131, '#7AA1EB']
let s:orange   = [ 67, '#FF8833']
let s:pink     = [166, '#fb8496']
let s:outerfg  = [ 16, '#8d96a1']
let s:outerfgi = [ 16, '#2f3d4d']

let s:warning     = [ 67, '#d70000']

" Backgrounds
let s:outerbg  = [ 16, 'NONE']
let s:innerbg  = [234, 'NONE']

" Normal mode
let s:N1 = [s:outerfg[1], s:darkgray[1], s:outerfg[0], s:gray[0]]
let s:N3 = [s:gray[1]   , s:innerbg[1], s:gray[0]   , s:innerbg[0]]

" Normal mode - modified
let s:NMMode = [s:golden[1], s:outerbg[1], s:gray[0], s:darkgray[0]]
let s:NM1 = [s:outerfg[1], s:outerbg[1], s:darkgray[0], s:gray[0]]
let s:NM3 = [s:gray[1]  , s:outerbg[1], s:gray[0], s:darkgray[0]]

" Insert mode
let s:I1 = [s:darkgray[1], s:golden[1], s:outerfg[0], s:golden[0]]
let s:I3 = [s:golden[1]  , s:innerbg[1], s:golden[0], s:innerbg[0]]

" Visual mode
let s:V1 = [s:darkgray[1], s:blue[1], s:outerfg[0], s:blue[0]]
let s:V3 = [s:blue[1]    , s:innerbg[1], s:blue[0], s:innerbg[0]]

" Replace mode
let s:R1 = [s:darkgray[1], s:orange[1], s:outerfg[0], s:orange[0]]
let s:R3 = [s:orange[1], s:innerbg[1], s:orange[0], s:innerbg[0]]

" Inactive pane
let s:IA = [s:darkgray[1], s:outerbg[1], s:innerbg[0], s:innerbg[0]]
let s:IAc = [s:gray[1], s:outerbg[1], s:outerbg[0], s:outerbg[0]]

let g:airline#themes#cornell#palette = {}
let g:airline#themes#cornell#palette.accents = {
    \ 'red': ['#d70000', '', 160, '', '']}

let g:airline#themes#cornell#palette.inactive = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:IAc,
    \ 'airline_x': s:IA,
    \ 'airline_y': s:IA,
    \ 'airline_z': s:IA}

let g:airline#themes#cornell#palette.inactive_modified = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:I3,
    \ 'airline_x': s:IA,
    \ 'airline_y': s:IA,
    \ 'airline_z': s:IA}

let g:airline#themes#cornell#palette.normal = {
    \ 'airline_a': s:N1,
    \ 'airline_b': s:I3,
    \ 'airline_c': s:I3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:N3}


let g:airline#themes#cornell#palette.normal_modified = {
    \ 'airline_a': s:NMMode,
    \ 'airline_b': s:I3,
    \ 'airline_c': s:I3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:NM3}

let g:airline#themes#cornell#palette.insert = {
    \ 'airline_a': s:I1,
    \ 'airline_b': s:I3,
    \ 'airline_c': s:I3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:I3}
let g:airline#themes#cornell#palette.insert_modified = {}

let g:airline#themes#cornell#palette.replace = {
    \ 'airline_a': s:R1,
    \ 'airline_b': s:R3,
    \ 'airline_c': s:R3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:R3}
let g:airline#themes#cornell#palette.replace_modified = {}

let g:airline#themes#cornell#palette.visual = {
    \ 'airline_a': s:V1,
    \ 'airline_b': s:V3,
    \ 'airline_c': s:V3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:V3}
let g:airline#themes#cornell#palette.visual_modified = {}

let g:airline#themes#cornell#palette.normal.airline_warning = s:NM1

let g:airline#themes#cornell#palette.normal_modified.airline_warning =
    \ g:airline#themes#cornell#palette.normal.airline_warning

let g:airline#themes#cornell#palette.insert.airline_warning =
    \ g:airline#themes#cornell#palette.normal.airline_warning

let g:airline#themes#cornell#palette.insert_modified.airline_warning =
    \ g:airline#themes#cornell#palette.normal.airline_warning

let g:airline#themes#cornell#palette.visual.airline_warning =
    \ g:airline#themes#cornell#palette.normal.airline_warning

let g:airline#themes#cornell#palette.visual_modified.airline_warning =
    \ g:airline#themes#cornell#palette.normal.airline_warning

let g:airline#themes#cornell#palette.replace.airline_warning =
    \ g:airline#themes#cornell#palette.normal.airline_warning

let g:airline#themes#cornell#palette.replace_modified.airline_warning =
    \ g:airline#themes#cornell#palette.normal.airline_warning

