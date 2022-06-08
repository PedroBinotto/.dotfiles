fun! StartProcess(command, errorMessage, tmuxWindow)
    if strchars(a:command) == 0
        echo a:errorMessage
        return
    end
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :'"a:tmuxWindow"' || tmux new-window -n '"a:tmuxWindow"';
    \      tmux send -t :'"a:tmuxWindow"' '"a:command"' Enter;
    \      tmux select-window -t 1;"
endfun

fun! KillProcess(tmuxWindow)
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :'"a:tmuxWindow"'  && tmux send -t :'"a:tmuxWindow"'  'C-c';"
endfun

fun! AppContextBuild()
    :call StartProcess(g:BuildApp,
                      \"Application 'build' configuration not defined. Check project .exrc for 'g:BuildApp'",
                      \"backend")
endfun

fun! AppContextRunBackend()
    :call StartProcess(g:RunBackend,
                     \"Backend server runner configuration not defined. Check project .exrc for 'g:RunBackend'",
                     \"backend")
endfun

fun! AppContextRunFrontend()
    :call StartProcess(g:RunFrontend,
                      \"Frontend server runner configuration not defined. Check project .exrc for 'g:RunFrontend'",
                      \"frontend")
endfun

fun! AppContextRunTests()
    :call StartProcess(g:RunTests,
                      \"Test runner configuration for application not defined. Check project .exrc for 'g:RunTests'",
                      \"test")
endfun

fun! AppContextKillBackend()
    :call KillProcess("backend")
endfun

fun! AppContextKillFrontend()
    :call KillProcess("frontend")
endfun

fun! AppContextKillTests()
    :call KillProcess("test")
endfun

fun! AppContextKillAll()
    :call AppContextKillBackend()
    :call AppContextKillFrontend()
    :call AppContextKillTests()
endfun

fun! AppContextRunAll()
    :call AppContextRunBackend()
    :call AppContextRunFrontend()
endfun

