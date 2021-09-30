# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -G'
PS1="\[\e[33m\]\W \[\e[32m\]⇨ \[\e[m\] "

alias gcl="git clone"
alias gp="git push"
alias gc="git commit"
alias gst="git status"
alias tmux="TERM=screen-256color tmux"
alias ls="ls --color -1"

export PATH="$PATH:$HOME/.cargo/bin/:$HOME/.yarn/bin:/usr/local/bin:/usr/sbin:/sbin"

export MYVIMRC="$HOME/.vimrc"

neofetch
