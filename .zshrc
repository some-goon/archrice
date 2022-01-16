# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt with no coloring:
# PS1="%B[%n@%M %~]$%b "

# Prompt with coloring:
autoload -U color && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[cyan]%}@%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Auto cd:
setopt autocd

# Emacs mode:
bindkey -e

# History config:
HISTFILE=~/.cache/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Completion:
autoload -Uz compinit
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' menu select
zstyle ':completion:*' prompt 'Command not found. Similar commands:'
zstyle :compinstall filename '/home/goon/.zshrc'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Aliases:
alias sudo='doas'
alias pacman='paru'
# Coloring aliases:
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'

# Run neofetch:
neofetch

# Load syntax highlighting:
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
