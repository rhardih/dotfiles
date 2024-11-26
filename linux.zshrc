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

