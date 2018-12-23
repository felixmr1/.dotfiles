# Vim mode
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# To get urxvt colors to work
TERM='rxvt-unicode'
COLORTERM='rxvt-unicode-256color'
