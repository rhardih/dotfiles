#!/usr/bin/env bash

set -euxo pipefail

# Assume dotfiles was cloned to ~/.dotfiles
pushd "$HOME"

# Symlink dotfiles

dotfiles=(
  .bash_profile
  .git-completion.bash
  .git-prompt.sh
  .gitconfig
  .gitignore
  .gitignore_global
  .gitmodules
  .tigrc
  .tmux
  .tmux.conf
  .vim
  .vimrc
)

for dotfile in "${dotfiles[@]}"; do
  ln -s .dotfiles/$dotfile $dotfile
done

pushd .dotfiles

sudo apt update && sudo apt -y install \
  bat \
  bmon \
  build-essential \
  cloc \
  ctags \
  curl \
  ffmpeg \
  fzf \
  git \
  git-lfs \
  graphviz \
  httrack \
  imagemagick \
  keychain \
  mpg123 \
  ncdu \
  nmap \
  openssl \
  pbzip2 \
  pv \
  renameutils \
  ripgrep \
  silversearcher-ag \
  tig \
  tmux \
  unrar

# Install Ruby version manager (chruby)
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
pushd chruby-0.3.9/
sudo make install
popd
rm -r chruby-0.3.9
rm chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz

# Install Ruby install tool (ruby-install)
wget -O ruby-install-0.8.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.1.tar.gz
tar -xzvf ruby-install-0.8.1.tar.gz
pushd ruby-install-0.8.1/
sudo make install
popd
rm -r ruby-install-0.8.1
rm ruby-install-0.8.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.1.tar.gz

# Load tmux plugins
echo "Remember to reload tmux plugins with 'prefix + I'"
tmux source-file ~/.tmux.conf

# pass
# Symlink only really makes sense after Cryptomator mounts, e.g.:
#
# ln -s /Volumes/GkYHTbHLQYzA_0/.password-store ~/.password-store
