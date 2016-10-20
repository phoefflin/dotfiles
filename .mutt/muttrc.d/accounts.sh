#!/bin/bash

function load_file () {
	eval cfgfile="$1"; 	# eval needed to resolve '~'
	if [ -e $cfgfile.asc ]; then
		gpg -q -d $cfgfile.asc
	elif [ -e $cfgfile ]; then
		cat $cfgfile
	else
		echo "# INFO: neither file '$cfgfile' nor '$cfgfile.asc' exist --> skip"
	fi
	ret=$?
	if [ $? -ne 0 ]; then
		echo "# error while reading file $cfgfile" >&2
	fi
	return $ret
}

# defaults to posteo/offline if nothing else is set.
my_account="${my_account:-posteo}"
my_account_type="${my_account_type:-offline}"

echo "set my_account      = '$my_account'"
echo "set my_account_type = '$my_account_type'"

# general account settings (both offline AND online), if needed.
load_file "~/.mutt/muttrc.d/accounts/account_${my_account}";
load_file "~/.mutt/muttrc.d/accounts/account_${my_account}_${my_account_type}"
exit $?
