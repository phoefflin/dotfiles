# basic settings for mail and friends
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ -n "$(type -p kubectl)" ]; then
	source <(kubectl completion bash)
fi
