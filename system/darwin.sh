echo "Startup for MacOS..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "oh-my-zsh is required!"
  return
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
export UPDATE_ZSH_DAYS=30
ZSH_CUSTOM=$ZEALISH

# ZSH Plugins
plugins=(git)

# Zealish Plugins
plugins+=(
  zealish
  zgit
)

# User configuration
path+=(
  /usr/local/bin
)
echo $plugins
source $ZSH/oh-my-zsh.sh
