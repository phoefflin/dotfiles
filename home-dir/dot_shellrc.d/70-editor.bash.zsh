EDITOR=nvim
# EDITOR=nvim
# if [ -n "$(type -p lvim)" ]; then
# 	export EDITOR=lvim
# elif [ -n $(type -p nvim) ]; then
# 	export EDITOR=nvim
# fi
export VISUAL="$EDITOR"
alias vim=$EDITOR
alias vi='vim -u NONEXISTENT_PROFILE'
