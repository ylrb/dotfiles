# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source manjaro-zsh-configuration
USE_POWERLINE="true"
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# To customize prompt for root, run 'p10k configure' as root
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Personal config
export EDITOR=/usr/bin/vim
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"
alias la="ls -a"

# Aliases
alias n="nvim"
alias py="python3"
alias b="bluetoothctl power on && bluetoothctl connect 94:DB:56:6D:BC:48"
alias b0="bluetoothctl disconnect && bluetoothctl power off"
alias myip="curl ipinfo.io/ip"
alias h="wihotspot"
alias m="udiskie & wait 3"
alias dotfiles="zsh ~/.dotfiles.sh"
alias time="date +"%H:%M:%S""
alias icat="kitty +kitten icat"
alias luamake=/luamake
alias lf="lfcd"

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'
