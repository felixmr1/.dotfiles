# remove greeting
set fish_greeting

# Start sway
if test (tty) = "/dev/tty1"

  sway --unsupported-gpu
end

# Commands to run in interactive sessions can go here
if status is-interactive
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end

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

# gcloud
# The next line updates PATH for the Google Cloud SDK.
bass source '/home/felix/.local/share/google-cloud-sdk/path.bash.inc'
# The next line enables shell command completion for gcloud.
bass source '/home/felix/.local/share/google-cloud-sdk/completion.bash.inc'


source ~/.api_keys

# pyenv
pyenv init - | source

alias gs="git status"
alias einride="cd /home/felix/Dev/einride/"
alias ld="lazydocker"
alias lg="lazygit"
alias bruce-vcu-go="cd ~/Dev/einride/bruce-vcu/go/v4"
alias simian-adapter="cd ~/Dev/einride/simian-adapter"

alias nvim="lvim"
alias lv="lvim"

set -U fish_user_paths /home/felix/.yarn/bin $fish_user_paths
set -U fish_user_paths /home/felix/.local/bin
set -Ux QT_QPA_PLATFORM wayland

fish_add_path ~/go/bin

