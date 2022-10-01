# remove greeting
set fish_greeting

# Commands to run in interactive sessions can go here
if status is-interactive
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end

# vi mode
function fish_user_key_bindings
  fish_vi_key_bindings
end

# Colors
#set pure_color_danger red
#set pure_color_dark	gray
#set pure_color_info	blue
#set pure_color_git_unpushed_commits gray
#set pure_color_mute yellow
#set pure_color_git_dirty gray
#set pure_color_hostname fish_color_host
#set pure_color_light flamingo
#set pure_color_username_normal fish_color_user
#set pure_color_normal blue
#set pure_color_primary green
#set pure_color_success green
#set pure_color_warning yellow

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
