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

alias serve='python -m SimpleHTTPServer'
alias emacs='vim'
alias vi='vim'
alias be='bundle exec'
alias bl='bundle --local'
alias hcinit='eval "$(.hc/bin/hc init -)"'

# Git
alias g='git'
alias gc='git checkout'
alias gd='git diff --color'
alias gf='git fetch'
alias gs='git status'
alias gr='git rebase'
alias gri='git rebase -i origin/master'

export EDITOR=vim

# Decorate prompt
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Add tab completion for commands and branches
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# Go
export GOPATH=/Users/rene/Code/go
export PATH=$PATH:$GOPATH/bin

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
