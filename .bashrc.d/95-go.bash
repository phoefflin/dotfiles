# try to find git-prompt.sh and source it
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ -n "$(type -p go)" ]; then
	# see https://raw.githubusercontent.com/gradle/gradle-completion/master/gradle-completion.bash
	$_bashrc_debug_echo "${BASH_SOURCE[0]}: golang bash competion"
	export GOPATH="${GOPATH:-$HOME/go}"
	if [ -d "$GOPATH/bin" ]; then
		PATH="$GOPATH/bin:$PATH"
		export PATH
	fi

fi
