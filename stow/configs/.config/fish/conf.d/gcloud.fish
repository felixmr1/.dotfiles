# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/share/google-cloud-sdk/bin"
    set -x PATH "$HOME/.local/share/google-cloud-sdk/bin" $PATH
end

set -gx PATH $HOME/.local/share/google-cloud-sdk/bin $PATH
