# p10k config
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo)
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

OPENER="vim"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"
alias la="ls -a"
alias py="python3"
alias b="bluetoothctl connect 94:DB:56:6D:BC:48 && exit"
alias b0="bluetoothctl disconnect && exit"
alias myip="curl ipinfo.io/ip"
alias h="wihotspot"
alias m="udiskie & wait 3"
alias dotfiles="zsh ~/.dotfiles.sh"
alias time="date +"%H:%M:%S""
alias icat="kitty +kitten icat"
