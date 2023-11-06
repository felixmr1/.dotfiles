# remove greeting
set fish_greeting

# vi mode
function fish_user_key_bindings
  fish_vi_key_bindings
end

# Pure config
set pure_symbol_git_dirty 🔸
set pure_symbol_git_unpulled_commits 🔻
set pure_symbol_git_unpushed_commits 🔺
# Dont set anything
set pure_symbol_git_stash 

# source profile
if test -f '/home/felix/.profile'
	bass source '/home/felix/.profile'
end


if test -f ~/.api_keys
	source ~/.api_keys
end

# pyenv
if which pyenv
	pyenv init - | source
end

alias gs="git status"
alias einride="cd /home/felix/Dev/einride/"
alias ld="lazydocker"
alias lg="lazygit"
alias bruce-vcu-go="cd ~/Dev/einride/bruce-vcu/go/v4"
alias simian-adapter="cd ~/Dev/einride/simian-adapter"
alias pfs="cd ~/Dev/einride/pod-fusion-service"
alias sc="source ~/.config/fish/config.fish"
alias cat="batcat --theme=Catppuccin-latte"

fish_add_path ~/go/bin

#if which direnv
#	direnv hook fish | source
#end

set -x N_PREFIX "$HOME/n"; contains "$N_PREFIX/bin" $PATH; or set -a PATH "$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
