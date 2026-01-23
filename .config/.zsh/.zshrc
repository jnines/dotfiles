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
_phc=$(hostname | cksum | awk '{print $1%256}')
setopt prompt_subst
setopt transient_rprompt
PROMPT='%B% %F{yellow}[%F{white}%~%F{yellow}] %(?..%B(%?%)%b) ${vcs_info_msg_0_}
%F{$_phc} %(!.#.⮚)%b%f '

RPROMPT='%F{172}%@'
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
_source_me "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" # arch & alp
_source_me "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"             # deb
# fzf completion
_source_me "/usr/share/fzf/completion.zsh"              # arch
_source_me "/usr/share/doc/fzf/examples/completion.zsh" # deb
_source_me "/usr/share/zsh/plugins/fzf/completion.zsh"  # alp
# fzf keybindings
_source_me "/usr/share/fzf/key-bindings.zsh"              # arch
_source_me "/usr/share/doc/fzf/examples/key-bindings.zsh" # deb
_source_me "/usr/share/zsh/plugins/fzf/key-bindings.zsh"  # alp
# autopair
_source_me "/usr/share/zsh/plugins/zsh-autopair/autopair.zsh" \
	&& autopair-init
# zsh-syntax-highlighting
_source_me "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # arch & alp
_source_me "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"             # deb
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

# ?
# _latest_kernel="$(/usr/bin/cat $HOME/.local/share/kver)"
# _current_kernel=$(/usr/bin/uname -r | /usr/bin/awk -F '-' '{print $1}')
# if [[ $_latest_kernel != $_current_kernel ]]; then
# 	kColor="red"
# else
# 	kColor="white"
# fi
#
# RPROMPT='%F{yellow}Latest: %U%F{$kColor}v$_latest_kernel%u %F{166}%@'
