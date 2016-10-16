# basic settings for mail and friends
$_bashrc_debug "in ${BASH_SOURCE[0]}"

# if msmtp-queue is installed: check for unsent mail
if [ -n "$(type -p msmtp-queue)" ]; then
	queue_info=$(msmtp-queue)
	case "$queue_info" in
	*[sS]ubject:*)
		echo "*************************************************"
		echo "| INFO: unsent mail in queue:"
		echo "|------------------------------------------------"
		echo "$queue_info" | sed 's/^/| /'
		echo "|------------------------------------------------"
		echo "| run 'msmtp-queue -r' to flush to send"
		echo "| or 'msmtp-queue -p' to purge mail"
		echo "*************************************************"
		;;
	esac
fi
