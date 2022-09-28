let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified', 'git-branch' ] ]
  \ },
  \ 'component': {
  \   'git-branch': ' %{FugitiveHead()}'
  \ },
  \ 'separator': {
  \     'left': '', 'right': ''
  \ },
  \ 'subseparator': {
  \ 'left': '', 'right': ''
  \ },
\ }

" \ 'colorscheme': 'solarized',

let g:lightline.component_function = { 'lineinfo': 'LightlineLineinfo' }

function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif

    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction

let g:lightline.component_function = { 'mode': 'LightlineMode' }

function! LightlineMode() abort
    let ftmap = {
                \ 'coc-explorer': 'EXPLORER',
                \ 'fugitive': 'FUGITIVE'
                \ }
    return get(ftmap, &filetype, lightline#mode())
endfunction

