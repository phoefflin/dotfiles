# basic settings for mail and friends
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

_terraform_path=$(type -p terraform)
if [ -n "$_terraform_path" ]; then
	$_bashrc_debug_echo "enabling terraform completion"
	complete -C ${_terraform_path} terraform
	alias tf=terraform
	complete -C ${_terraform_path} tf
fi
