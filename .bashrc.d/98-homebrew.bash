$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
	$_bashrc_debug_echo "${BASH_SOURCE[0]}: enable BREW"
	# I'd rather append the brew path to the end of the PATH variable
	_PATH_SAVE="$PATH"
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
	PATH="$_PATH_SAVE:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin"
	unset _PATH_SAVE
fi
