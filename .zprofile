#!/bin/zsh

# $PATH:$PATH=HTAP$
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.local/bin/evil-software"

# Defaults:
export EDITOR="nvim"
export TERMINAL="terminator"
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

# Stop DDOS'ing my logs
export QT_LOGGING_RULES="*=false"

# ...Probably a bad idea
export WINEESYNC=1

# Nvidia Caches
export __GL_SHADER_DISK_CACHE_SIZE=26843531856
