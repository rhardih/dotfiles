# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gem ruby osx brew)

source $ZSH/oh-my-zsh.sh

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Sencha
export PATH=$PATH:~/Code/Sencha/bin/Sencha/Cmd/3.1.1.274

# X11
export PATH=$PATH:/usr/X11/bin

# Rbenv
export PATH=$PATH:~/.rbenv/bin

export LC_CTYPE=UTF-8

alias vimdiff='/Applications/MacVim.app/Contents/MacOS/Vim -d'
alias serve='python -m SimpleHTTPServer'
alias emacs=vim
alias be='bundle exec'
alias helpcenter='cd ~/Code/Zendesk/help_center && eval "$(~/Code/Zendesk/help_center/.hc/bin/hc init -)"'

unsetopt correct_all

export EDITOR=vim
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator && source $HOME/.tmuxinator/scripts/tmuxinator_completion

# Initialize rbenv
eval "$(rbenv init -)"
