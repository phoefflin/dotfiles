# basic settings for mail and friends
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

_az_compl_path=$(type -p az.completion.sh)
if [ -n "$_az_compl_path" ]; then
	$_bashrc_debug_echo "sourcing '$_az_compl_path'"
	source "$_az_compl_path"
fi
