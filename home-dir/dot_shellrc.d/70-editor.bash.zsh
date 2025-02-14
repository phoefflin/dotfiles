# pager
# export PAGER='less -R'
export BAT_THEME="Nord"
export PAGER='bat'
alias c=bat

# editor
EDITOR=nvim
export VISUAL="$EDITOR"

alias vim=$EDITOR
alias vi='vim -u NONEXISTENT_PROFILE'
# alias o=xdg-open
# alias c='codium -n'
alias c='code'
alias z='zeditor -n'
alias e="$EDITOR"

# alias ejson='__json_tmp_file=$(mktemp /tmp/jsonedit-XXXXXXXXXX.json) && xclip -selection clipboard -o >$__json_tmp_file && e -c "lua vim.lsp.buf.format()" $__json_tmp_file'

alias fzfe='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" --bind "enter:become($EDITOR {})"'

