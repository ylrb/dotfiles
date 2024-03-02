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
alias pm="python manage.py"
alias b="bluetoothctl power on && bluetoothctl connect 94:DB:56:6D:BC:48"
alias b0="bluetoothctl disconnect && bluetoothctl power off"
alias myip="curl ipinfo.io/ip"
alias h="wihotspot"
alias dotfiles="zsh ~/.dotfiles.sh"
alias icat="kitty +kitten icat"
alias luamake=/luamake
alias lf="lfcd"
alias y="ytfzf -T swayimg -t"

export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

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

export PATH="$HOME/.local/bin:$PATH"
export XDG_DATA_HOME="$HOME/.local/share"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yl/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yl/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/yl/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/yl/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /usr/share/nvm/init-nvm.sh
