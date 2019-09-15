# Vim mode
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Auto-complete with sudo
complete -cf sudo

# ALIAS
# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
# Color cat - print file with syntax highlighting.
alias ccat="highlight --out-format=ansi --force"
alias e="exit"
alias r="ranger"
alias gs="git status"

alias ss="sudo systemctl"

# To get urxvt colors to work
TERM='rxvt-unicode'
COLORTERM='rxvt-unicode-256color'

# PS1 conf
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
