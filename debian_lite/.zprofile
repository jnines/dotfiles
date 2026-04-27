#!/bin/zsh

# $PATH:$PATH=HTAP$
export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/git/bin"

# Defaults:
export EDITOR="nvim"
export DIFFPROG="nvim -d"
export TERMINAL="ghostty"
export BROWSER="firefox"

# fd fzf
export FZF_DEFAULT_COMMAND='fdfind --hidden --color=always --type file --no-ignore -E node_modules -E .git -E .snapshots'
export FZF_DEFAULT_OPTS='--ansi'
# Get Out:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME/.zsh"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PYTHONHISTORY="$XDG_CACHE_HOME/python/history"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/.node_repl_history"

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# Gruvbox Material-ish less
export MANROFFOPT=-c
# export GROFF_NO_SGR=1
export LESS='-INSJj.5'
# Bold
export LESS_TERMCAP_md=$'\e[1;38;2;215;153;33m'
# End bold
export LESS_TERMCAP_me=$'\e[0m'
# Blink
export LESS_TERMCAP_mb=$'\e[1;38;2;234;105;98m'
# Search / Standout
export LESS_TERMCAP_so=$'\e[48;2;153;68;68;38;2;212;190;152m'
export LESS_TERMCAP_se=$'\e[0m'
# Underline
export LESS_TERMCAP_us=$'\e[4;38;2;122;162;247m'
export LESS_TERMCAP_ue=$'\e[0m'
# Reverse
export LESS_TERMCAP_mr=$'\e[7m'
# Dim
export LESS_TERMCAP_mh=$'\e[2;38;2;146;131;116m'
# Don't know, just reset
export LESS_TERMCAP_ZN=$'\e[0m'
export LESS_TERMCAP_ZV=$'\e[0m'
export LESS_TERMCAP_ZO=$'\e[0m'
export LESS_TERMCAP_ZW=$'\e[0m'

# Preload keys
if command -v keychain >/dev/null 2>&1; then
	eval "$(keychain --eval --quiet)"
fi
