local status_ok, tmux = pcall(require, "user.tmux")
if not status_ok then
	print("Failed to load module 'user.tmux'.")
	return
end

local M = {}

function M.build_app()
	tmux.start_process(
		vim.g.BuildApp,
		"Application 'build' configuration not defined. Check project .exrc for 'g:BuildApp'",
		"backend"
	)
end

function M.run_backend()
	tmux.start_process(
		vim.g.RunBackend,
		"Backend server runner configuration not defined. Check project .exrc for 'g:RunBackend'",
		"backend"
	)
end

function M.run_frontend()
	tmux.start_process(
		vim.g.RunFrontend,
		"Frontend server runner configuration not defined. Check project .exrc for 'g:RunFrontend'",
		"frontend"
	)
end

function M.run_tests()
	tmux.start_process(
		vim.g.RunTests,
		"Test runner configuration for application not defined. Check project .exrc for 'g:RunTests'",
		"test"
	)
end

function M.run_all()
	M.run_backend()
	M.run_frontend()
end

function M.kill_backend()
	tmux.kill_process("backend")
end

function M.kill_frontend()
	tmux.kill_process("frontend")
end

function M.kill_tests()
	tmux.kill_process("tests")
end

function M.kill_all()
	M.kill_backend()
	M.kill_frontend()
end

return M
