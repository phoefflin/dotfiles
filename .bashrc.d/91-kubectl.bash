# basic settings for mail and friends
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ -n "$(type -p kubectl)" ]; then
	source <(kubectl completion bash)
	# set alias and corresponding completion
	alias k=kubectl
	source <(kubectl completion bash| sed 's/kubectl/k/g')
fi

