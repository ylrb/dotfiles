# Manjaro default settings
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Personal config
export EDITOR=/usr/bin/vim
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"
alias la="ls -a"

# Aliases
alias py="python3"
alias b="bluetoothctl power on && bluetoothctl connect 94:DB:56:6D:BC:48"
alias b0="bluetoothctl disconnect && bluetoothctl power off"
alias myip="curl ipinfo.io/ip"
alias h="wihotspot"
alias m="udiskie & wait 3"
alias dotfiles="zsh ~/.dotfiles.sh"
alias time="date +"%H:%M:%S""
alias icat="kitty +kitten icat"
