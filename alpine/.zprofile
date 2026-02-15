#!/bin/zsh

# $PATH:$PATH=HTAP$
export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"

# Defaults:
export EDITOR="nvim"
export DIFFPROG="nvim -d"

# fd fzf
export FZF_DEFAULT_COMMAND='fd --hidden --color=always --type file --no-ignore -E node_modules -E .git -E .snapshots'
export FZF_DEFAULT_OPTS='--ansi'
# Get Out:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME/.zsh"
export PYTHONHISTORY="$XDG_CACHE_HOME/python/history"
