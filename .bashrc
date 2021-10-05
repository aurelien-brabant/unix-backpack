# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"

export PATH="$PATH:$HOME/.cargo/bin/:$HOME/.yarn/bin:/usr/local/bin:/usr/sbin:/sbin"

if [ "$(uname)" == "Linux" ]; then
	alias ls='ls --color -1'
else
	alias ls='ls -G1'
fi

# 42-specific configuration
if echo "$(hostname)" | grep '42' > /dev/null; then
	if [ "$(uname)" == "Darwin" ]; then
		printf "42 configuration loaded\n"
		if test -d "$HOME/.brew"; then
			printf "Brew detected, specialized PATH\n"
			export PATH="$HOME/.brew/bin:$PATH"
		fi
		alias 42drp='open /sgoinfre/goinfre/Perso/aguiot--/public/RP42.app'
	fi
fi

PS1="\[\e[33m\]\W \[\e[32m\]⇨ \[\e[m\] "

alias gcl="git clone"
alias gp="git push"
alias gc="git commit"
alias gst="git status"
alias tmux="TERM=screen-256color tmux"

# need to specialize that too
alias sway="XDG_CURRENT_DESKTOP=sway dbus-run-session sway"


export MYVIMRC="$HOME/.vimrc"
