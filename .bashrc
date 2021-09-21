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

export PATH="$PATH:$HOME/.cargo/bin/:$HOME/.yarn/bin"

export MYVIMRC="$HOME/.vimrc"
