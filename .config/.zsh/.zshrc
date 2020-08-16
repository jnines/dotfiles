# Changing mode takes too long
export KEYTIMEOUT=1

# Disable Ctrl+s
stty stop undef

# Colors
autoload -U colors && colors

# Spells
setopt correct
correct_ignore='_*'

# Pretties
setopt prompt_subst
setopt transient_rprompt
PROMPT='%B% %F{58}┌%F{yellow}[%F{white}%~%F{yellow}] ${vcs_info_msg_0_}
%F{58}└╼%F{166}$%b%f '

RPROMPT='${VIMODE}'

# Tab Completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)

# Smewline
setopt no_prompt_cr

# Load stuff
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.config/.zsh/.aliasrc" ] && source "$HOME/.config/.zsh/.aliasrc"
[ -f "$HOME/.config/.zsh/.bindings" ] && source "$HOME/.config/.zsh/.bindings"
[ -f "$HOME/.config/.zsh/.functionsrc" ] && source "$HOME/.config/.zsh/.functionsrc"
[ -f "$HOME/.config/.zsh/.sshrc" ] && source "$HOME/.config/.zsh/.sshrc"

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

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/fzf/completion.zsh 2>/dev/null
source /usr/share/fzf/key-bindings.zsh 2>/dev/null
eval "$(zoxide init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Pasties
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

# Terminal URL escape
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Binds
zle -N zle-line-init
zle -N zle-keymap-select

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%F{223}%b %F{117}➡ %F{180}%r%f👀'
zstyle ':vcs_info:*' enable git
