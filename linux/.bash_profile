if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export PS1="[\w]\[$(tput setaf 1)\]\$(__git_ps1)\n"
export PS1="$PS1\[$(tput setaf 4)\]\[$(tput bold)\]\u \[$(tput sgr0)\]\\$ "
