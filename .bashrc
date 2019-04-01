# Vim mode
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Docker shortcuts for kanidatarbete
alias ros-start="xhost +local:felix-ros && docker start felix-ros-container"
alias ros-stop="docker stop felix-ros-container"
alias ros-enter="docker exec -ti felix-ros-container /bin/bash"

# To get urxvt colors to work
TERM='rxvt-unicode'
COLORTERM='rxvt-unicode-256color'

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
