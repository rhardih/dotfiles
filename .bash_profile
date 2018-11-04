if [ -f /etc/profile ]; then
  PATH=""
  source /etc/profile
fi

export PATH=$HOME/bin:/usr/local/bin:/usr/local/Cellar/mysql55/5.5.30/bin:$PATH
export PS1="[\w]\[$(tput setaf 1)\]\$(__git_ps1)\n\[$(tput setaf 4)\]"
export PS1="$PS1\[$(tput bold)\]\u \[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]\[$(tput sgr0)\]"

# Rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

## Sencha
export PATH=$PATH:/Code/Sencha/bin/Sencha/Cmd/3.1.1.274

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

# Go
export GOPATH=/Users/rene/Code/go
export PATH=$PATH:$GOPATH/bin

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Docker
alias dc='docker-compose'
alias dm='docker-machine'

# Homebrew

export HOMEBREW_NO_ANALYTICS=1
alias cask='brew cask'
export PATH=/usr/local/sbin:$PATH

# Utils

# Various scripts
export PATH=~/.dotfiles/bin:$PATH

# md5c
#
# Perform md5 checksum validation of a file against
# a specified md5 hash.
#
# usage: md5c filename hash
function md5c {
  filename="$1"
  md5_hash=$(echo "$2" | tr '[:upper:]' '[:lower:]')
  md5_output="$(md5 $1)"
  diff="${md5_output%"$md5_hash"}"
  expected="MD5 ($1) = "

  if [ "$diff" = "$expected" ]; then
    echo "Checksum verified."
  else
    echo "Checksum failed."
  fi
}

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
