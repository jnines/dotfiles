#!/bin/zsh

# $PATH:$PATH=HTAP$
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.local/bin/evil-software"
export PATH=$PATH:"$HOME/.local/bin/git/bin"

# Defaults:
export EDITOR="nvim"
export DIFFPROG="nvim -d"
export TERMINAL="alacritty"
export BROWSER="firefox"

# Get Out:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/.zsh"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CCACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ccache"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/.gnupg"
export CUDA_CACHE_PATH="${XDG_CONFIG_HOME:-$HOME/.cache}/.nv"
export PARALLEL_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/parallel"
export PYTHONHISTORY="${XDG_CACHE_HOME:-$HOME/.cache}/python/history"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"

# Stop DDOS'ing my logs
export QT_LOGGING_RULES="*=false"

export WINEFSYNC=1
export VKD3D_CONFIG=upload_hvv

# Nvidia Caches
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="/1tb/.nvcache"
#export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export __GL_SHADER_DISK_CACHE_SIZE=21474836480
