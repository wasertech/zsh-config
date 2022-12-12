# Use powerline
USE_POWERLINE="true"
# Source singularity-zsh-configuration
if [[ -e /usr/share/zsh/singularity-zsh-config ]]; then
  source /usr/share/zsh/singularity-zsh-config
fi
# Use singularity zsh prompt
if [[ -e /usr/share/zsh/singularity-zsh-prompt ]]; then
  source /usr/share/zsh/singularity-zsh-prompt
fi
