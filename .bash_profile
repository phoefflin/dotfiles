

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
export PS1='\033[34m\u@\h\033[m:\[\033[32m\]\w\[\033[m\]\[\033[37m\] $(__git_ps1 "(%s)")\[\033[m\]\n\$ '

