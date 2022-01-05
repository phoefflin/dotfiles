# try to find git-prompt.sh and source it
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"


if [ -d "$HOME/.jenv" ]; then
	# see https://raw.githubusercontent.com/gradle/gradle-completion/master/gradle-completion.bash
	$_bashrc_debug_echo "${BASH_SOURCE[0]}: enabling jenv java env switcher"

    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"

    _ps1_jenv_cmd='$(jenv version 2>/dev/null | awk "{print \$1}" | sed "s/system//" )'

fi
