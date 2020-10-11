if [ -f /etc/profile ]; then
  PATH=""
  source /etc/profile
fi

export LC_ALL=en_US.UTF-8

export PATH=$HOME/bin:/usr/local/bin:/usr/local/Cellar/mysql55/5.5.30/bin:$PATH
export PS1="[\w]\[$(tput setaf 1)\]\$(__git_ps1)\n\[$(tput setaf 4)\]"
export PS1="$PS1\[$(tput bold)\]\u \[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]\[$(tput sgr0)\]"

# Rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

alias emacs='vim'
alias vi='vim'
alias be='bundle exec'
alias bl='bundle --local'

export EDITOR=vim

# Git

# Decorate prompt
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Add tab completion for commands and branches
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# Add aliases
alias g='git';               __git_complete g _git
alias gc='git checkout';     __git_complete gc _git_checkout
alias gd='git diff --color'; __git_complete gd _git_diff
alias gf='git fetch';        __git_complete gf _git_fetch
alias gs='git status';       __git_complete gs _git_status
alias gr='git rebase';       __git_complete gr _git_rebase
alias gri='git rebase -i origin/master'

# gerrit
gerrit() {
  if [[ $1 == "push" ]]; then
    git push origin HEAD:refs/for/master
  else
    echo "I only know push. Sorry..."
  fi
}

# Go
export GOPATH=/Users/rene/Code/go
export PATH=$PATH:$GOPATH/bin

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Docker
alias dc='docker-compose'
alias dcprod='docker-compose -f docker-compose.yml -f production.yml'
alias dm='docker-machine'

# Homebrew

export HOMEBREW_NO_ANALYTICS=1
export PATH=/usr/local/sbin:$PATH
export HOMEBREW_GITHUB_API_TOKEN=$(pass tokens/homebrew_github_api)

# Flutter

export PATH=$PATH:~/Code/flutter/bin

# Android
alias adb='/Users/rene/Code/Android/sdk/platform-tools/adb'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Utils

# Various scripts
export PATH=~/.dotfiles/bin:$PATH

# Open a random file in current folder
function orandom {
  open "$(ls | head -$(($RANDOM % `ls | wc -l` + 1)) | tail -1)"
}

# offline website
function offline() {
  httrack "$@"
}

# show gzip compression ratio for a given url
function gzratio()
{
  tmp_file=$(mktemp)
  compressed=$( \
    curl -v -so /dev/null --compressed "$1" -w '%{size_download}' 2> $tmp_file \
  )
  uncompressed=$(curl -so /dev/null "$1" -w '%{size_download}')
  ratio=$(bc -l <<< "($uncompressed - $compressed) / $uncompressed * 100")

  grep "Content-Encoding" $tmp_file | sed "s/< //g"

  echo "Uncompressed: $uncompressed bytes"
  echo "Compressed: $compressed bytes"
  printf "Compression ratio: %.2f%%\n" $ratio

  rm $tmp_file
}

# VLC
alias vlcn='vlc --extraintf ncurses'

# lorem ipsum
function curlipsum()
{
  curl http://metaphorpsum.com/paragraphs/$1/$2
}

# docker-cleanup
#
# Removes old and unused docker images and containers
#
# https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
function docker-cleanup()
{
  docker rm $(docker ps -qa --no-trunc --filter "status=exited")

  docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
  #docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')
}

# git-biggest
#
# Shows the size and name of the 20 biggest files in a git repository
function git-biggest()
{
  git ls-tree -r -l --full-name HEAD | \
    awk '{print $4, $5}' | \
    sort -n -r | \
    head -20 | \
    numfmt --to=iec
}
