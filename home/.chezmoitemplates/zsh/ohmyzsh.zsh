# Set up https://ohmyz.sh
ZSH=$HOME/.dotfiles/oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_AUTO_UPDATE="true"
ZSH_CUSTOM=$HOME/.dotfiles/zsh/custom
ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
HIST_STAMPS="yyyy-mm-dd"

# Plugins from $ZSH/plugins/* or $ZSH/custom/plugins/*
plugins=(
  history
  zsh-vi-mode
  # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
