# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# ls in color
export CLICOLOR=1
# grep in color
export GREP_OPTIONS='--color=auto'

# append to the history file, don't overwrite it
shopt -s histappend

alias vi="nvim"

case $TERM in
screen*)
  PSGREEN='\[\033[0;32m\]'
  PSCLEAR='\[\033[0m\]'
  export PS1="${PSGREEN}[\u:screen \W]\$${PSCLEAR} "
  export TERM=xterm-256color
  ;;
*)
  PSRED='\[\033[0;35m\]'
  PSCLEAR='\[\033[0m\]'
  export PS1="${PSRED}[\u \W]\$${PSCLEAR} "
  ;;
esac

export EDITOR=/usr/bin/vi

