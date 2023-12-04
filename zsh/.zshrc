#/bin/zsh

source $HOME/.options.zsh
source $HOME/.zap-prompt/zap-prompt.zsh-theme
source $HOME/.zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.keymaps.zsh
source $HOME/.aliases.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_OPTIONS="--max-old-space-size=8192"
  export PATH=$HOME/.cargo/bin:$PATH
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
