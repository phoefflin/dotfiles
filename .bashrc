# bash config for interactive shells
_bashrc_debug=:
# get some debugging infos with:
# _bashrc_debug="echo INFO: "

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

$_bashrc_debug "in ${BASH_SOURCE[0]}"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=2000
HISTFILESIZE=2000

export HISTCONTROL HISTSIZE HISTFILESIZE

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s checkwinsize

# set default editor
export EDITOR=vim
export PAGER=less

if [ -f ~/.dir_colors ]; then
	# setup nice colors
	eval $(dircolors ~/.dir_colors)
	alias ls='ls --color=auto'
fi

# add personal bin directries to $PATH
for _bindir in	\
	~/bin	\
	~/bin.local; do
	if [ -d "$_bindir" ]; then
		case "$PATH" in
		*${_bindir}:*)
			: already in
			;;
		*)	PATH="$_bindir:$PATH"
			;;
		esac
	fi
done
unset _bindir

# source all *.bash files in .bashrc.d in alphanumerical order
if [ -d ~/.bashrc.d ]; then
	for _file in ~/.bashrc.d/*.bash; do
		source $_file
	done
	unset _file
fi

# unset debugging helper variable
unset _bashrc_debug
# vim:ft=sh
