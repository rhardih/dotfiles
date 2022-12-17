if [ -f /etc/profile ]; then
  PATH=""
  source /etc/profile
fi


# Exports

export GOPATH=/Users/rene/Code/go
export HOMEBREW_GITHUB_API_TOKEN=$(pass tokens/homebrew_github_api)
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:~/Code/flutter/bin
export PATH=/usr/local/bin:/usr/local/Cellar/mysql55/5.5.30/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/.dotfiles/bin:$PATH
export PS1="[\w]\[$(tput setaf 1)\]\$(__git_ps1)\n\[$(tput setaf 4)\]"
export PS1="$PS1\[$(tput bold)\]\u \[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]\[$(tput sgr0)\]"


# chruby

source /usr/local/opt/chruby/share/chruby/chruby.sh

# Aliases

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi


# Android

alias adb='/Users/rene/Code/Android/sdk/platform-tools/adb'


# nvm

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# npm

# Load npm tab completion

source <(npm completion)

# Rust

. "$HOME/.cargo/env"

# Utils

# Open a random file in current folder
function orandom {
  open "$(ls | head -$(($RANDOM % `ls | wc -l` + 1)) | tail -1)"
}

# VLC

alias vlcn='vlc --extraintf ncurses'

# bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
