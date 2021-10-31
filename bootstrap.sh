#!/usr/bin/env bash

# Shared bootstrap steps

# Change the default pinentry mode, from ncurses "popup" to line mode prompt.
# Reason: If dismissed incorrectly the default would background the pinentry
# process and take up 100% CPU and also blocking new terminal spawns.
#
# Note: pinentry is used by pass
mkdir -p ~/.gnupg
echo "pinentry-mode loopback" >> ~/.gnupg/gpg.conf

# Initialise submodules (tmux/vim plugins)
git submodule init
git submodule update

# Generate help docs for vim plugins
pushd .vim/pack/rhardih/start

for plugin in */
do
  vim -u NONE -c "helptags $plugin/doc" -c q
done

popd

case "$(uname -s)" in
  Linux*) . linux/bootstrap.sh;;
  Darwin*) . darwin/bootstrap.sh;;
  *) echo "Unknown system $(uname -s)"
esac

# pass
echo "The standard unix password manager, pass, has been installed."
echo "To use it, remember to clone the private store and import the GPG key"
echo "from the Cryptomator vault. The password for the GPG key is in Lastpass."
echo
echo "\$ git clone ssh://git@<repo-url>/rhardih/pass.git ~/.password-store"
echo
echo "gpg --import /Volumes/Cryptomator/<key-name>.key"
