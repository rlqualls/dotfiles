#
# ~/.bashrc
#

# If not running interactively, don't do anything
export EDITOR=ed
export VISUAL=vim

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

shopt -s -q autocd

source ~/.aliases
source ~/.rvm/scripts/rvm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
