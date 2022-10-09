# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

alias py="python3"
alias b="bluetoothctl connect 94:DB:56:6D:BC:48 && exit"
alias b0="bluetoothctl disconnect && exit"
alias matlab="export MESA_LOADER_DRIVER_OVERRIDE=i965; /usr/local/MATLAB/R2022b/bin/matlab -nosplash"
alias myip="curl ipinfo.io/ip"
