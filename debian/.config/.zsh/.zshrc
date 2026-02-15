# Changing mode takes too long
export KEYTIMEOUT=1

# De-Highlight paste
zle_highlight=('paste:none')

# Disable Ctrl+s
stty stop undef

# Colors
autoload -U colors && colors

# Spells
setopt correct
correct_ignore='_*'

# Pretties
_phc=$(cat /etc/hostname | cksum | awk '{print $1%256}')
setopt prompt_subst
setopt transient_rprompt
PROMPT='%B% %F{$_phc}%m%f%F{yellow}[%F{white}%~%F{yellow}] %(?..%B(%?%)%b) ${vcs_info_msg_0_}
%F{$_phc} %(!.#.⮚)%b%f '

# Tab Completion
autoload -U compinit
setopt menucomplete
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)

# Smewline
setopt no_prompt_cr

# VI
bindkey -v
export VI_MODE_SET_CURSOR=true
zle-keymap-select() {
	if [[ ${KEYMAP} == vicmd ]]; then
		echo -ne '\e[4 q'
		cmd_md="N"
	else
		echo -ne '\e[2 q'
		cmd_md=""
	fi
}
yank-to-cb() {
	zle vi-yank
	echo "${CUTBUFFER}" | wl-copy -p
}

zle -N zle-keymap-select
zle -N yank-to-cb

# Load stuff
_source_me() {
	if [ -r "$1" ]; then
		source "$1"
	fi
}

_source_me "$HOME/.aliases"
_source_me "$HOME/.bash_aliases"
_source_me "$HOME/.config/aliasrc"
_source_me "$HOME/.config/.zsh/.aliasrc"
_source_me "$HOME/.config/.zsh/.bindings"
_source_me "$HOME/.config/.zsh/.functionsrc"
_source_me "$HOME/.config/.zsh/.sshrc"

# mapfile
zmodload zsh/mapfile

# Auto cd
setopt auto_cd
setopt cdablevars

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/.zshistory
setopt histignoredups
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups

# zsh-autosuggestions
_source_me "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" # deb
# fzf completion
_source_me "/usr/share/doc/fzf/examples/completion.zsh" # deb
# fzf keybindings
_source_me "/usr/share/doc/fzf/examples/key-bindings.zsh" # deb
# zsh-syntax-highlighting
_source_me "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # deb
eval "$(zoxide init zsh)"

# Pasties
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

# Terminal URL escape
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Git
autoload -Uz vcs_info
precmd_vcs_info() {
	vcs_info
}
precmd_functions+=(precmd_vcs_info)
zstyle ':vcs_info:git:*' formats '%F{196}[%F{214}%b%F{196}] %F{117}➡  %F{180}%r%f'
zstyle ':vcs_info:*' enable git

# Edit in nvim
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line
