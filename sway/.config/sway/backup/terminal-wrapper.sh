#!/bin/bash

# set in  ~/.bashrc.d/90-prompt.bash
_DIR="$(cat /dev/shm/terminal-cwd.$USER 2>/dev/null || echo $PWD)"
_TERMINAL="$1"

case "$_TERMINAL" in
alacritty) _ARGS="--working-directory=$_DIR" ;;
*) _ARGS="--directory=$_DIR" ;;
esac

exec "$_TERMINAL" "$_ARGS"
