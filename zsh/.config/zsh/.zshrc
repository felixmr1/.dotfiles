plugins=(
	git
	golang
	docker
)

SPACESHIP_PROMPT_ORDER=(user host dir git)
source $HOME/.oh-my-zsh/oh-my-zsh.sh
eval "$(starship init zsh)"

source /usr/share/nvm/init-nvm.sh
source $HOME/.api_keys

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/felix/.local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/home/felix/.local/share/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/felix/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/felix/.local/share/google-cloud-sdk/completion.zsh.inc'; fi

# aliases
alias gs="git status"
alias einride="cd /home/felix/Dev/einride"
alias lg="lazygit"

# pyenv stuff
eval "$(pyenv init --path)"
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin

export PATH=$PATH:/home/felix/go/bin
export STARSHIP_CONFIG=$HOME/.config/zsh/starship.toml
