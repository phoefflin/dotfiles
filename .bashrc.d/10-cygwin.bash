# Settings fpr cygwin environments
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

case "$(uname)" in
CYGWIN*)
	# Try to figure out if X is running and set DISPLAY accordingly. This
	# is sort of a hack, since I'm only running cygwin terminals on my
	# local machine and there's only one X running that's good enough for
	# me...
	if [ -S "/tmp/.X11-unix/X0" ]; then
		export DISPLAY=:0
	fi
	;;
esac
