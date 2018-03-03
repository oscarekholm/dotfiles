# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias vim=nvim
alias magic="yarn cache clean && rm -rf ./node_modules && yarn"
alias tmux="TERM=screen-256color-bce tmux"

# Vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey '^R' history-incremental-search-backward

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(thefuck --alias)"

export PATH="$PATH:~/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
