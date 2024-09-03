local status_ok, utils = pcall(require, "user.utils")
if not status_ok then
	print("[tmux.lua] Failed to load module 'user.utils'.")
	return
end

local M = {}

function M.start_process(command, errorMessage, tmuxWindow)
	if utils.is_empty(command) then
		print(errorMessage)
		return
	end
	local cmd = ":silent exe '"
		.. [[![ -z "$TMUX" ] && echo "Not attached to a TMUX session." && exit 1; tmux has-session -t :"]]
		.. tmuxWindow
		.. [[" || tmux new-window -n "]]
		.. tmuxWindow
		.. [["; tmux send -t :"]]
		.. tmuxWindow
		.. '" "'
		.. command
		.. [[" Enter; tmux select-window -t 1;'
  ]]
	vim.cmd(cmd)
end

function M.kill_process(tmuxWindow)
	local cmd = [[:silent exe '![ -z "$TMUX" ] && echo "Not attached to a TMUX session." && exit 1; tmux has-session -t :"]]
		.. tmuxWindow
		.. '" && tmux send -t :"'
		.. tmuxWindow
		.. [[" "C-c";']]
	vim.cmd(cmd)
end

return M
