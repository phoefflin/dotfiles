# GNUPG variables
$_bashrc_debug "in ${BASH_SOURCE[0]}"

# get tty for pinentry
GPG_TTY=$(tty)
export GPG_TTY
