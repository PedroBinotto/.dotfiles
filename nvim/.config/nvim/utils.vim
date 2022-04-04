fun! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfun

fun! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfun

command -bang -nargs=? QFix call QFixToggle(<bang>0)
fun! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfun

fun! GoToBuffer(ctrlId)
    if (a:ctrlId > 9) || (a:ctrlId < 0)
        echo "CtrlID must be between 0 - 9"
        return
    end

    let contents = g:win_ctrl_buf_list[a:ctrlId]
    if type(l:contents) != v:t_list
        echo "Nothing There"
        return
    end

    let bufh = l:contents[1]
    call nvim_win_set_buf(0, l:bufh)
endfun

let g:win_ctrl_buf_list = [0, 0, 0, 0]
fun! SetBuffer(ctrlId)
    if has_key(b:, "terminal_job_id") == 0
        echo "You must be in a terminal to execute this command"
        return
    end
    if (a:ctrlId > 9) || (a:ctrlId < 0)
        echo "CtrlID must be between 0 - 9"
        return
    end

    let g:win_ctrl_buf_list[a:ctrlId] = [b:terminal_job_id, nvim_win_get_buf(0)]
endfun

fun! SendTerminalCommand(ctrlId, command)
    if (a:ctrlId > 9) || (a:ctrlId < 0)
        echo "CtrlId must be between 0 - 9"
        return
    end
    let contents = g:win_ctrl_buf_list[a:ctrlId]
    if type(l:contents) != v:t_list
        echo "Nothing There"
        return
    end

    let job_id = l:contents[0]
    call chansend(job_id, command)
endfun

fun! VertTerm()
    :vsplit | term
endfun


fun! AppContextBuild()
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :backend || tmux new-window -n backend;
    \      tmux send -t :backend '"g:BuildApp"' Enter;
    \      tmux select-window -t 1;"
endfun

fun! AppContextRunBackend()
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :backend || tmux new-window -n backend;
    \      tmux send -t :backend '"g:RunBackend"' Enter;
    \      tmux select-window -t 1;"
endfun

fun! AppContextRunFrontend()
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :frontend || tmux new-window -n frontend;
    \      tmux send -t :frontend '"g:RunFrontend"' Enter;
    \      tmux select-window -t 1;"
endfun

fun! AppContextRunAll()
    :call AppContextRunBackend()
    :call AppContextRunFrontend()
endfun

fun! AppContextKillAll()
    if strchars(g:RunFrontend) == 0
        echo "Nothing here!"
    end
endfun

