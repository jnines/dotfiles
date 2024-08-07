#!/bin/zsh

# $PATH:$PATH=HTAP$
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.local/bin/git/bin"
export PATH=$PATH:"$HOME/.local/share/npm/bin"
export PATH=$PATH:"$HOME/.local/share/pnpm"

# pnpm
# pnpm end

# Defaults:
export EDITOR="nvim"
export DIFFPROG="nvim -d"
export TERMINAL="alacritty"
export BROWSER="firefox"

# rg fzf
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files'
# Get Out:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/.zsh"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export GNUPGHOME="$XDG_DATA_HOME/.gnupg"
export CUDA_CACHE_PATH="$XDG_CONFIG_HOME/.nv"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PYTHONHISTORY="$XDG_CACHE_HOME/python/history"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/.node_repl_history"
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export BUN_INSTALL="$XDG_DATA_HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# FF
export LIBVA_DRIVER_NAME=nvidia
export MOZ_DISABLE_RDD_SANDBOX=1
export NVD_BACKEND=direct

# Stop DDOS'ing my logs
export QT_LOGGING_RULES="*=false"

export WINEFSYNC=1
export VKD3D_CONFIG=upload_hvv

# Nvidia Caches
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="/1tb/.nvcache"
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export __GL_SHADER_DISK_CACHE_SIZE=10737418240

# CHANGE ME!
export MOZ_ENABLE_WAYLAND=1
