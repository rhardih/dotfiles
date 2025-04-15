# ssh
#
# keychain
#
# keychain - re-use ssh-agent and/or gpg-agent between logins
keychain id_rsa id_ed25519
. ~/.keychain/`uname -n`-sh

# snap bins
export PATH="/snap/bin:$PATH"

# nvim from pre-built archives
export PATH="$PATH:/opt/nvim-linux64/bin"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# BEGIN asdf COMPLETIONS
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
# END asdf COMPLETIONS
. ~/.asdf/plugins/golang/set-env.zsh
