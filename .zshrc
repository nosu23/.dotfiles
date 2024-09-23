#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [ "$(uname -m)" = "arm64" ]; then
  export PATH="$PATH:/opt/homebrew/bin"
  export ANYENV_ROOT="$HOME/.anyenv_arm64"
  export PATH="$HOME/.anyenv_arm64/bin:$PATH"
  export ANYENV_DEFINITION_ROOT=$HOME/.config/anyenv_arm64/anyenv-install
  eval "$(anyenv init -)"
  # Appleシリコン用のHomebrewで入れた各種env用のパスはここに書く
  export PATH="/opt/homebrew/bin:$PATH" 
  export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
else
  export PATH=$PATH:/opt/homebrew-x86_64/bin
  export ANYENV_ROOT="$HOME/.anyenv_x64"
  #export PATH="$HOME/.anyenv_x64/bin:$PATH"
  export ANYENV_DEFINITION_ROOT=$HOME/.config/anyenv_x64/anyenv-install
  eval "$(anyenv init -)"
  # Intelプロセッサ用のHomebrewで入れる各種env用のパスはここに書く
fi

export GPG_TTY=$TTY

# load settings
source ~/.zsh/alias.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/keybind.zsh
source ~/.zsh/setopt.zsh