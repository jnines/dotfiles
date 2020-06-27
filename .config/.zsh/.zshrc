bindkey "\e[3~" delete-char
bindkey '^ ' autosuggest-accept
# Disable Ctrl+s
stty stop undef

# Colors
autoload -U colors && colors

PROMPT="%B% %F{58}┌%F{yellow}[%F{white}%~%F{yellow}] 
%F{58}└╼%F{166}$%b%f "

RPROMPT="%F{green}%@, %W%f"

# Tab Completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)
setopt no_prompt_cr

# Load stuff
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.config/.zsh/.aliasrc" ] && source "$HOME/.config/.zsh/.aliasrc"
[ -f "$HOME/.config/.zsh/.functionsrc" ] && source "$HOME/.config/.zsh/.functionsrc"
[ -f "$HOME/.config/.zsh/.sshrc" ] && source "$HOME/.config/.zsh/.sshrc"


# Auto cd
setopt auto_cd

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/.zshistory

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/fzf/completion.zsh 2>/dev/null
source /usr/share/fzf/key-bindings.zsh 2>/dev/null
eval "$(zoxide init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
