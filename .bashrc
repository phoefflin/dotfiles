
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

export HISTCONTROL HISTSIZE HISTFILESIZE

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s checkwinsize

# setup nice colors
eval $(dircolors ~/.dir_colors)
alias ls='ls --color'

# set default editor
export EDITOR=vim

# bash prompt
# - check for __git_ps1 function and download if missing 
if [  -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
fi
if [ -z "$(declare -f -F  __git_ps1)" ]; then
	echo "$0: downloading ~/.git-prompt.sh"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
	source ~/.git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\[\033[37m\] $(__git_ps1 "(%s)")\[\033[m\]\n\$ '

