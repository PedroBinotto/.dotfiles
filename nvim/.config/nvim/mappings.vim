nnoremap mm :MaximizerToggle<CR>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

nnoremap <silent>= :10winc > <CR>
nnoremap <silent>- :10winc < <CR>
nnoremap <silent>+ :10winc + <CR>
nnoremap <silent>_ :10winc - <CR>

nnoremap <leader>F :Telescope live_grep<CR>
nnoremap <leader>fe :Telescope grep_string<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>g :GitGutterToggle<CR>

nnoremap <leader>p :Telescope git_files <CR>
nnoremap <leader>P :Telescope fd<CR>

nnoremap <leader>[ :cprev<CR>
nnoremap <leader>] :cnext<CR>

nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <M-/> <Esc>/\%V
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

nnoremap <leader>R :so ~/.config/nvim/init.vim<CR>

nmap <silent> <leader>Q :QFix<CR>

nmap <leader>z :ZenMode<CR>

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <F2> <Plug>(coc-rename)
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
map <C-_> :Commentary<CR>

nmap <F24>         :<C-U>PreviewDefinition<CR>
nmap <leader>K     :<C-U>PreviewDefinition<CR>
nmap <silent> gp   :<C-U>PreviewDefinition<CR>

nmap <leader>tu :call GoToBuffer(0)<CR>
nmap <leader>te :call GoToBuffer(1)<CR>
nmap <leader>to :call GoToBuffer(2)<CR>
nmap <leader>ta :call GoToBuffer(3)<CR>

nmap <leader>tsu :call SetBuffer(0)<CR>
nmap <leader>tse :call SetBuffer(1)<CR>
nmap <leader>tso :call SetBuffer(2)<CR>
nmap <leader>tsa :call SetBuffer(3)<CR>

nnoremap <leader>cf :call AppContextRunFrontend()<CR>
nnoremap <leader>cb :call AppContextRunBackend()<CR>
nnoremap <leader>ct :call AppContextRunTests()<CR>

nnoremap <leader>ckb :call AppContextKillBackend()<CR>
nnoremap <leader>ckf :call AppContextKillFrontend()<CR>
nnoremap <leader>ckt :call AppContextKillTests()<CR>

nnoremap <leader>cc :call AppContextBuild()<CR>
nnoremap <leader>cr :call AppContextRunAll()<CR>
nnoremap <leader>cK :call AppContextKillAll()<CR>

nmap <leader>vt :call VertTerm()<CR>
nmap <leader>nt :term<CR>

vmap <expr>  <leader>m  VMATH_YankAndAnalyse()
nmap         <leader>m  vip++

nmap <leader>H :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <leader>h+ :lua require("harpoon.mark").add_file()<CR>
nmap <leader>hu :lua require("harpoon.ui").nav_file(1)<CR>
nmap <leader>he :lua require("harpoon.ui").nav_file(2)<CR>
nmap <leader>ho :lua require("harpoon.ui").nav_file(3)<CR>
nmap <leader>ha :lua require("harpoon.ui").nav_file(4)<CR>
nmap <leader>hp :lua require("harpoon.ui").nav_prev() <CR>
nmap <leader>hn :lua require("harpoon.ui").nav_next() <CR>

