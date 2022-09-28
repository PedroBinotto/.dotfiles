nnoremap mm :MaximizerToggle<CR>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

nnoremap <leader>F :Telescope live_grep<CR>
nnoremap <leader>fe :Telescope grep_string<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>\ :Telescope lsp_dynamic_workspace_symbols<CR>
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

nnoremap <silent> <leader>= :10winc > <CR>
nnoremap <silent> <leader>- :10winc < <CR>
nnoremap <silent> <leader>+ :10winc + <CR>
nnoremap <silent> <leader>_ :10winc - <CR>

nnoremap <leader>R :so ~/.config/nvim/init.vim<CR>

nmap <silent> <leader>Q :QFix<CR>

nmap <leader>z :ZenMode<CR>

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
map <C-_> :Commentary<CR>

nmap <F24>         :<C-U>PreviewDefinition<CR>
nmap <leader>K     :<C-U>PreviewDefinition<CR>
nmap <silent> gp   :<C-U>PreviewDefinition<CR>

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

nnoremap <silent> gd :Telescope lsp_definitions<CR>
nnoremap <silent> gD :Telescope lsp_type_definitions<CR>
nnoremap <silent> gr :Telescope lsp_references<CR>

nnoremap <silent> <leader>d :Telescope diagnostics<CR>

nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> [g <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g <cmd>lua vim.diagnostic.goto_next()<CR>

nnoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>

