autocmd FileType tex inoremap <leader>em \emph{}<Space><><Esc>T{i
autocmd FileType tex inoremap <leader>bf \textbf{}<Space><><Esc>T{i
autocmd FileType tex imap <leader>bg \begin{<>}<Enter>\end{<>}<Esc>kT{vi{<C-n><C-n>
autocmd FileType tex inoremap <leader>ul \begin{itemize}<Enter><><Enter>\end{itemize}<Esc>2k/<><Enter>cw
autocmd FileType tex inoremap <leader>ol \begin{enumerate}<Enter>\<><Enter>end{enumerate}<Esc>2k/<><Enter>cw
autocmd FileType tex inoremap <leader>it \textit{}<Space><><Esc>T{i
autocmd FileType tex inoremap <leader>tt \texttt{}<Space><><Esc>T{i
autocmd FileType tex inoremap <leader>tit \title{}<Space><><Esc>T{i
autocmd FileType tex inoremap <leader>ct \cite{}<Space><><Esc>T{i
autocmd FileType tex inoremap <leader>up \usepackage{}<Esc>T{i
autocmd FileType tex inoremap <leader>sec \section{}<Enter><Enter><><Esc>2kf{a
autocmd FileType tex inoremap <leader>ssec \subsection{}<Enter><Enter><><Esc>2kf{a
autocmd FileType tex inoremap <leader>sssec \subsubsection{}<Enter><Enter><><Esc>2kf{a
autocmd FileType tex nnoremap <leader>wr /<><Enter>cw

fun! LatexCompileDocument()
    let s:filePath = expand('%:p')
    let g:TeXCompile = 'compileTex ' . s:filePath
    :call StartProcess(g:TeXCompile,
                      \"No configuration for 'g:TeXCompile'",
                      \g:LatexCompileWindow)
endfun

fun! LatexStartPreview()
    let s:filePath = expand('%:p:r')
    let g:TeXPreview = 'zathura ' . s:filePath .'.pdf'
    :call StartProcess(g:TeXPreview,
                      \"No configuration for 'g:TeXPreview'",
                      \g:LatexPreviewWindow)
endfun

fun! LatexStopPreview()
    :call KillProcess(g:LatexPreviewWindow)
endfun

autocmd BufWritePost *.tex :call LatexCompileDocument()
