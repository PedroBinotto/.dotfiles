nnoremap mm :MaximizerToggle<CR>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

inoremap jk <ESC>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>F :Rg ''<CR>

nnoremap <C-[> :cprev<CR>
nnoremap <C-]> :cnext<CR>

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

nmap <C-l> :NERDTreeToggle<CR>
nmap <leader>l :NERDTreeFind<CR>
nmap <silent> <leader>Q :QFix<CR>

nmap <leader>z :ZenMode<CR>

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <F2> <Plug>(coc-rename)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
map <C-_> :Commentary<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nnoremap <leader>cr :call AppContextRunAll()<CR>
nnoremap <leader>cc :call AppContextBuild()<CR>
" nnoremap <leader>ck :call AppContextKillAll()<CR>

nmap <leader>vt :call VertTerm()<CR>
nmap <leader>nt :term<CR>

nmap <leader>H :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <leader>h+ :lua require("harpoon.mark").add_file()<CR>
nmap <leader>hu :lua require("harpoon.ui").nav_file(1)<CR>
nmap <leader>he :lua require("harpoon.ui").nav_file(2)<CR>
nmap <leader>ho :lua require("harpoon.ui").nav_file(3)<CR>
nmap <leader>ha :lua require("harpoon.ui").nav_file(4)<CR>
nmap <leader>hp :lua require("harpoon.ui").nav_prev() <CR>
nmap <leader>hn :lua require("harpoon.ui").nav_next() <CR>

