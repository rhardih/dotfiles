if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export PS1="[\w]\[$(tput setaf 1)\]\$(__git_ps1)\n"
export PS1="$PS1\[$(tput setaf 4)\]\[$(tput bold)\]\u \[$(tput sgr0)\]\\$ "

# ssh
keychain id_rsa
. ~/.keychain/`uname -n`-sh

# go

export PATH=$PATH:$(go env GOPATH)/bin

# local

export PATH=$PATH:/home/rene/.local/bin
