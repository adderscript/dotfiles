#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="/home/alasdair/bin:$PATH"

fastfetch

alias ls='ls --color=auto'
alias grep='grep --color=auto'
eval "$(starship init bash)"
