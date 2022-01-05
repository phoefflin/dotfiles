# bash prompt definition
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ -n "$(type -p task)" ]; then
	alias t=task
	alias to=taskopen
	alias tl='task list'
	if [ -f /usr/share/bash-completion/completions/task ]; then
		source <(cat /usr/share/bash-completion/completions/task |
			 sed -e 's/_task/_t/g' -e 's/^\(complete.*\)\<task\>/\1t/g')
	fi
fi
