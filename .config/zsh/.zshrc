# Options:
setopt correct	 		# Command correction
setopt autocd	 		# Auto directory change
setopt nobeep			# Disable beeping
setopt extendedglob		# Extended globing (allows the use of regular expressions)

# Prompt with no coloring:
# PS1="%B[%n@%M %~]$%b "

# Prompt with coloring:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[cyan]%}@%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
bindkey -e

# History config:
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

# Completion:
autoload -Uz compinit
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' menu select
zstyle ':completion:*' prompt 'Command not found. Similar commands:'
zstyle :compinstall filename '/home/goon/.zshrc'
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zmodload zsh/complist
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)

# Coloring aliases:
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
# Aliases:
alias sudo='doas'
alias pacman='paru'
alias code='vscodium --extensions-dir "$XDG_DATA_HOME/vscode"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias dtfs='ls ~ -a -I . -I .. -I .ssh -I .cache -I .config -I .local -I .xprofile -I .zprofile | grep "^[.]"'
alias rmdir='rm -rf'
alias neofetch='fastfetch'

# Powerline go config:
function powerline_precmd() {
    PS1="$($GOPATH/bin/powerline-go --modules "venv,user,host,ssh,cwd,perms,hg,jobs,exit,root" -error $? -jobs ${${(%):%j}:-0})"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    install_powerline_precmd
fi

# Run pfetch:
fastfetch

# Load syntax highlighting:
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
# Load autosuggestions:
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
