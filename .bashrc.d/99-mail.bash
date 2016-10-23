# basic settings for mail and friends
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

# check for errors in error logs of all running offlineimap processes:
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}: checking offlineimap logs"
for pid in $(pgrep offlineimap); do
	# get logfile name from process' open file descriptors
	logs=$(ls -l /proc/$pid/fd/*| egrep '.log$' | awk '{ print $NF}')
	# should be just one, but just to be sure:
	for log in $logs; do
		errors="$(grep -i "error" $log| tail -10)"
		if [ -n "$errors" ]; then
			echo "*************************************************************"
			echo "| WARNING:"
			echo "| Errors found in $log, please check, last messages:"
			echo "|-----------------------------------------------------------"
			echo "$errors" | sed 's/^/| ... /'
			echo "*************************************************************"
			echo
		fi
	done
done
unset pid logs log errors

# if msmtp-queue is installed: check for unsent mail
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}: checking unsent messages in msmtp queue"
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
	unset queue_info
fi

