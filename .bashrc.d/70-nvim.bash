# try to find git-prompt.sh and source it
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ -n "$(type -p nvim)" ]; then
	export EDITOR=nvim
	export VISUAL="$EDITOR"
	alias vim=nvim
	alias vim-real=/usr/bin/vim
fi

