# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"

alias la="ls -a"
alias py="python3"
alias b="bluetoothctl connect 94:DB:56:6D:BC:48 && exit"
alias b0="bluetoothctl disconnect && exit"
alias matlab="echo "!!!\ Use\ load_sl_glibc_patch\ command\ in\ Matlab\ before\ launching\ Simulink\ if\ needed" && export MESA_LOADER_DRIVER_OVERRIDE=i965; /usr/local/MATLAB/R2022b/bin/matlab -nosplash"
alias myip="curl ipinfo.io/ip"
alias h="wihotspot"
alias m="udiskie & wait 3"
alias dotfiles="zsh ~/.dotfiles.sh"
alias time="date +"%H:%M:%S""
alias icat="kitty +kitten icat"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
