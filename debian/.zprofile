#!/bin/zsh

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/git/bin"
export PATH=$PATH:"$HOME/.local/share/npm/bin"
export PATH=$PATH:"$HOME/.local/share/pnpm"
export PATH=$PATH:"$HOME/.local/share/cargo/bin"

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
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/.gtkrc-2.0"
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME/.zsh"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GNUPGHOME="$XDG_DATA_HOME/.gnupg"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PYTHONHISTORY="$XDG_CACHE_HOME/python/history"
# export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/.node_repl_history"

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# export MOZ_ENABLE_WAYLAND=1
# CHANGE ME!

# Preload a couple keys
# eval $(keychain --eval --quiet --dir "$HOME"/.local/share/keychain nines nines.rsa)
