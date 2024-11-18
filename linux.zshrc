# ssh
#
# keychain
#
# keychain - re-use ssh-agent and/or gpg-agent between logins
keychain id_rsa id_ed25519
. ~/.keychain/`uname -n`-sh

export PATH="/snap/bin:$PATH"
