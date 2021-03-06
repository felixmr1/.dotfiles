# Vim mode
set -o vi

export EDITOR="nvim"

# Make caps an additional esc key
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

#Show git branch in commandline
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# PS1 conf
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]: \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\$(parse_git_branch) $ \[$(tput sgr0)\]"

export GITHUB_API_TOKEN="ab88b1b86e0b561cbb3832adad45b231792d7955"
export CLOUDSDK_PYTHON="python2"
source "/home/felix/.local/share/devtools/rust/1.39.0/cargo/env"
