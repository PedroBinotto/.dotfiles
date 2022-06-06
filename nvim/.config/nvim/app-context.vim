fun! AppContextBuild()
    if strchars(g:BuildApp) == 0
        echo "Application 'build' configuration not defined. Check project .exrc for 'g:RunBackend'"
        return
    end
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :backend || tmux new-window -n backend;
    \      tmux send -t :backend '"g:BuildApp"' Enter;
    \      tmux select-window -t 1;"
endfun

fun! AppContextRunBackend()
    if strchars(g:RunBackend) == 0
        echo "Backend server runner configuration not defined. Check project .exrc for 'g:RunBackend'"
        return
    end
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :backend || tmux new-window -n backend;
    \      tmux send -t :backend '"g:RunBackend"' Enter;
    \      tmux select-window -t 1;"
endfun

fun! AppContextRunFrontend()
    if strchars(g:RunFrontend) == 0
        echo "Frontend server runner configuration not defined. Check project .exrc for 'g:RunFrontend'"
        return
    end
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :frontend || tmux new-window -n frontend;
    \      tmux send -t :frontend '"g:RunFrontend"' Enter;
    \      tmux select-window -t 1;"
endfun

fun! AppContextRunTests()
    if strchars(g:RunTests) == 0
        echo "Test runner configuration for application not defined. Check project .exrc for 'g:RunTests'"
        return
    end
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :test || tmux new-window -n test;
    \      tmux send -t :test '"g:RunTests"' Enter;
    \      tmux select-window -t 1;"
endfun

fun! AppContextKillBackend()
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :backend  && tmux send -t :backend  'C-c';"
endfun

fun! AppContextKillFrontend()
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :frontend && tmux send -t :frontend 'C-c';"
endfun

fun! AppContextKillTests()
    :silent exe "![ -z '$TMUX' ] && echo 'Not attached to a TMUX session.' && exit 1;
    \      tmux has-session -t :test && tmux send -t :test 'C-c';"
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

