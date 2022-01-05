$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ -n "$(type -p eksctl)" ]; then
	$_bashrc_debug_echo "${BASH_SOURCE[0]}: enable eksctl completion"
	source <(eksctl completion bash)

fi
