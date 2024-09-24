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
unset LD_LIBRARY_PATH

# Aliases
alias n="nvim"
alias py="python3"
alias epy="env/bin/python"
alias epip="env/bin/pip"
alias myip="curl ipinfo.io/ip"
alias dotfiles="zsh ~/.dotfiles.sh"
alias luamake=/luamake
alias lf="lfcd"

export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export TERM=xterm-256color

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
export PATH="$PATH:/home/yl/.local/share/gem/ruby/3.0.0/bin"
export XDG_DATA_HOME="$HOME/.local/share"

source /usr/share/nvm/init-nvm.sh
