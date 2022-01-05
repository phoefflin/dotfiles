# bash prompt definition
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

# define prompt (including git infos)
if [ -z "$(declare -f -F  __git_ps1)" ]; then
	_ps1_gitinfo=
else
	_ps1_gitinfo=' $(__git_ps1 "git:%s")'
fi

if [ -n "$(type -p kubectl)" ]; then
	_k8s_get_context() {
		_ctx=$(kubectl config current-context 2>/dev/null)
		[ -n "$_ctx" ] && echo " k8s:$_ctx"
	}
	_ps1_k8s='$(_k8s_get_context)'
else
	_ps1_k8s=
fi

_ps1_jdk=
if [ -n "$_ps1_jenv_cmd" ]; then
    _jenv_get_local() {
        local _jdk=$(eval echo $_ps1_jenv_cmd)
        [ -n "$_jdk" ] && echo " jenv:$_jdk"
    }
    _ps1_jdk='$(_jenv_get_local)'
fi

# add number of running jobs to prompt, but only if greater than 0
PROMPT_COMMAND='_ps1_hasjobs=$(jobs -p)'

# register CWD for new termonals (see http://blog.soulshake.net/2016/03/i3-new-terminals-in-pwd)
PROMPT_COMMAND="$PROMPT_COMMAND; pwd > /dev/shm/terminal-cwd.$USER"


# that takes way too long
# export GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\[\033[36m\]'"${_ps1_gitinfo}${_ps1_k8s}"'\n${_ps1_hasjobs:+(\j jobs) }\[\033[m\]\$ '
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\[\033[36m\]'"${_ps1_gitinfo}${_ps1_jdk}${_ps1_k8s}"'${_ps1_hasjobs:+(\j jobs) }\[\033[m\]\n'

