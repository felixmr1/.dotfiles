# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
	git
	golang
	docker
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
