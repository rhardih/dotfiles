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

case "$(uname -s)" in
  Linux*) . linux/bootstrap.sh;;
  Darwin*) . darwin/bootstrap.sh;;
  *) echo "Unknown system $(uname -s)"
esac
