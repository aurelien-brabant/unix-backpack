# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"

export PATH="$PATH:$HOME/.cargo/bin/:$HOME/.yarn/bin:/usr/local/bin:/usr/sbin:/sbin"

# Replace standard UNIX utilities by more handy ones {{{

if command -v bat &> /dev/null
then
	alias cat="bat"
elif command -v batcat &> /dev/null
then
	alias cat="batcat"
fi

if command -v exa &> /dev/null
then
	alias ls="exa -l"
elif [ "$(uname)" == "Linux" ]; then
	alias ls='ls --color -1'
else
	alias ls='ls -G1'
fi

# }}}

# 42-specific configuration
if echo "$(cat /etc/hostname)" | grep '42' > /dev/null; then
	if [ "$(uname)" == "Darwin" ]; then
		printf "42 configuration loaded\n"
		if test -d "$HOME/.brew"; then
			printf "Brew detected, specialized PATH\n"
			export PATH="$HOME/.brew/bin:$PATH"
		fi
		alias 42drp='open /sgoinfre/goinfre/Perso/aguiot--/public/RP42.app'
	fi
fi

export PS1="\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\] - \[$(tput sgr0)\]\[\033[38;5;8m\]\w\[$(tput sgr0)\]\[\033[38;5;9m\]]\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;7m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

if command -v git &> /dev/null;
then
	alias gcl="git clone"
	alias gp="git push"
	alias gc="git commit"
	alias gst="git status"
fi

if command -v tmux &> /dev/null
then
	alias tmux="TERM=$TERM tmux";
fi

# need to specialize that too
if command -v sway &> /dev/null;
then
	alias sway="XDG_CURRENT_DESKTOP=sway dbus-run-session sway"
fi

export MYVIMRC="$HOME/.vimrc"

if command -v nvim &> /dev/null;
then
	alias vim="nvim"
fi

# load private aliases if any
private_aliases_path="$HOME/.alias.priv.sh"
if [ -f $private_aliases_path ];
then
	source $private_aliases_path
fi
