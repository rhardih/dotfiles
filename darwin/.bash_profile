if [ -f /etc/profile ]; then
  PATH=""
  source /etc/profile
fi


# Exports

export GOPATH=/Users/rene/Code/go
export HOMEBREW_GITHUB_API_TOKEN=$(pass tokens/homebrew_github_api)
export HOMEBREW_NO_ANALYTICS=1
export NVM_DIR="$HOME/.nvm"
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:~/Code/flutter/bin
export PATH=/usr/local/bin:/usr/local/Cellar/mysql55/5.5.30/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/.dotfiles/bin:$PATH
export PS1="[\w]\[$(tput setaf 1)\]\$(__git_ps1)\n\[$(tput setaf 4)\]"
export PS1="$PS1\[$(tput bold)\]\u \[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]\[$(tput sgr0)\]"


# Rbenv

eval "$(rbenv init -)"


# Aliases

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi


# Gerrit

gerrit() {
  if [[ $1 == "push" ]]; then
    git push origin HEAD:refs/for/master
  else
    echo "I only know push. Sorry..."
  fi
}


# Android

alias adb='/Users/rene/Code/Android/sdk/platform-tools/adb'


# nvm

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Utils

# Open a random file in current folder
function orandom {
  open "$(ls | head -$(($RANDOM % `ls | wc -l` + 1)) | tail -1)"
}

# VLC

alias vlcn='vlc --extraintf ncurses'

# bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
