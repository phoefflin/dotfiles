# bash prompt definition
$_bashrc_debug "in ${BASH_SOURCE[0]}"

# define prompt (including git infos)
if [ -z "$(declare -f -F  __git_ps1)" ]; then
	_ps1_gitinfo=
else
	_ps1_gitinfo=' $(__git_ps1 "(%s)")'
fi

# add number of running jobs to prompt, but only if greater than 0
PROMPT_COMMAND='_ps1_hasjobs=$(jobs -p)'

# that takes way too long
# export GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\[\033[37m\]'"$_ps1_gitinfo"'\n${_ps1_hasjobs:+(\j jobs) }\[\033[m\]\$ '
