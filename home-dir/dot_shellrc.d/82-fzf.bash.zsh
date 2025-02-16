# color scheme nord: 
# https://github.com/fnune/base16-fzf/blob/master/bash/base16-nord.config

# Base16 Nord
# Author: arcticicestudio

_gen_fzf_default_opts() {

local color00='#2E3440'
local color01='#3B4252'
local color02='#434C5E'
local color03='#4C566A'
local color04='#D8DEE9'
local color05='#E5E9F0'
local color06='#ECEFF4'
local color07='#8FBCBB'
local color08='#BF616A'
local color09='#D08770'
local color0A='#EBCB8B'
local color0B='#A3BE8C'
local color0C='#88C0D0'
local color0D='#81A1C1'
local color0E='#B48EAD'
local color0F='#5E81AC'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

}

_gen_fzf_default_opts


alias fzfe='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" --bind "enter:become($EDITOR {})"'

