if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
  fish_vi_key_bindings
end

# The next line updates PATH for the Google Cloud SDK.
bass source '/home/felix/.local/share/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
bass source '/home/felix/.local/share/google-cloud-sdk/completion.bash.inc'

alias gs="git status"
alias einride="cd /home/felix/Dev/einride/"
