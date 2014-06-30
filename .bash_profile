export PATH=$HOME/bin:/usr/local/bin:/usr/local/Cellar/mysql55/5.5.30/bin:$PATH
export PS1="[\[\033[32m\]\w]\[\033[0m\]\$(__git_ps1)\n\[\033[1;36m\]\u\[\033[32m\] $\[ \033[0m\]"

# Rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

## Sencha
export PATH=$PATH:/Code/Sencha/bin/Sencha/Cmd/3.1.1.274

alias serve='python -m SimpleHTTPServer'
alias emacs=vim
alias be='bundle exec'
alias bl='bundle --local'
alias hcinit='eval "$(.hc/bin/hc init -)"'

# Git
alias g='git'
alias gc='git checkout'
alias gd='git diff --color'
alias gf='git fetch'
alias gri='git rebase -i origin/master'
alias gs='git status'

export EDITOR=vim

source /usr/local/etc/bash_completion.d/git-prompt.sh

