# basic settings for mail and friends
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ -n "$(type -p oc)" ]; then
	source <(oc completion bash)
fi

if [ -n "$(type -p minishift)" ]; then
	source <(minishift completion bash)
fi
