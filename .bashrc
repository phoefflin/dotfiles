
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

export HISTCONTROL HISTSIZE HISTFILESIZE

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s checkwinsize

if [ -f ~/.dir_colors ]; then
	# setup nice colors
	eval $(dircolors ~/.dir_colors)
	alias ls='ls --color'
fi

# set default editor
export EDITOR=vim
export PAGER=less



case "$(uname)" in
CYGWIN*)
	# Cygwin-install: try to figure out if X is runnang and set DISPLAY accordingly.
	# This is sort of a hack, since I'm only running cygwin terminals on my local machine 
	# and there's only one X running that's good enough for me...
	if [ -S "/tmp/.X11-unix/X0" ]; then
		export DISPLAY=:0
	fi
	;;
esac

# git prompt unfortunately takes too much time...
# # bash prompt
# # - check for __git_ps1 function and download if missing 
# if [  -f ~/.git-prompt.sh ]; then
# 	source ~/.git-prompt.sh
# fi
# if [ -z "$(declare -f -F  __git_ps1)" ]; then
# 	echo "$0: downloading ~/.git-prompt.sh"
# 	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
# 	source ~/.git-prompt.sh
# fi
# export GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\[\033[37m\] $(__git_ps1 "(%s)")\[\033[m\]\n\$ '
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\[\033[37m\]\[\033[m\]\n\$ '


# vim:ft=sh
