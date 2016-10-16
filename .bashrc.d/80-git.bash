# try to find git-prompt.sh and source it
$_bashrc_debug "in ${BASH_SOURCE[0]}"

for _file in \
    ~/.git-prompt.sh \
    /usr/share/git-core/contrib/completion/git-prompt.sh \
    /usr/share/git/git-prompt.sh; do
	if [ -f "$_file" ]; then
		break	
	fi
	_file=
done

# if none of the above could be found, download it:
if [ -z "$_file" ]; then
	echo "${BASH_SOURCE[0]}: downloading ~/.git-prompt.sh"
	curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh &&
	_file=~/.git-prompt.sh
fi

[ -n "$_file" ] && source "$_file"
unset _file
