all:
	mkdir -p $$HOME/Library/LaunchAgents
	stow --verbose --target=$$HOME --restow git/ kitty/ nvim/ task/ tmux/ zsh/ latexmk/ zathura/ anacron/ launchd/
	stow --verbose --target=$$HOME/.local/bin --restow shellscripts

delete:
	stow --verbose --target=$$HOME --delete git/ kitty/ nvim/ task/ tmux/ zsh/ latexmk/ zathura/ anacron/ launchd/
	stow --verbose --target=$$HOME/.local/bin --delete shellscripts
