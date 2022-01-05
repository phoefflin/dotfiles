# basic settings for mail and friends
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

_aws_compl_path=$(type -p  aws_completer)
if [ -n "$_aws_compl_path" ]; then
	$_bashrc_debug_echo "enabling AWS cli completion"
	complete -C "$_aws_compl_path" aws
fi
