#
# ~/.bashrc
#

# startx at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Check the window size after each command
shopt -s checkwinsize

# Default application
export PAGER='most'
export EDITOR='emacs'

export PATH=$PATH:~/bin

# Alias
alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias l='ll'
alias ll='ls -l'
alias la='ls -la'

alias cl='clear'
alias f='fg'

alias lock='slimlock > /dev/null 2>&1'

alias reload='source ~/.bashrc'

alias gitst='git status'
alias gitco='git commit -m'
alias gitp='git push'
alias gita='git add'

# Power control
alias suspend='systemctl suspend'
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias hibernate='systemctl hibernate'

# Prefix-sensitive history
# bind '"\e[A":history-search-backward'
# bind '"\e[B":history-search-forward'
