#!/usr/bin/env bash

set -euxo pipefail

export PATH=/usr/local/bin:$PATH

ruby -v

# Assume dotfiles was cloned to ~/.dotfiles
pushd $HOME

# Symlink dotfiles

dotfiles=(
  .bash_aliases
  .zsh_aliases
  .bash_profile
  .git-completion.bash
  .git-prompt.sh
  .gitconfig
  .gitignore
  .gitignore_global
  .gitmodules
  .rspec
  .tigrc
  .tmux
  .tmux.conf
  .vim
  .vimrc
  .gdbinit
)

for dotfile in "${dotfiles[@]}"; do
  ln -s -f .dotfiles/$dotfile $dotfile
done

# .config for jrnl
ln -s -f .dotfiles/darwin/.config .config

# zsh & oh-my-zsh
ln -s -f .dotfiles/darwin/.zshrc .zshrc
ln -s -f .dotfiles/darwin/.oh-my-zsh .oh-my-zsh

# clone zsh plugins
DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [ ! -d "$DIR" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$DIR"
fi

DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [ ! -d "$DIR" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  "$DIR"
fi

DIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
if [ ! -d "$DIR" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$DIR"
fi

# Install Homebrew & make i available to the rest of the script
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

pushd .dotfiles

# Install brews and casks
brew bundle --file=darwin/Brewfile

# Install crontab
echo 'Installing crontab, this might require security confirmation'
crontab ./crontab

popd

# Add Material Design colour palette to Inkscape
mkdir -p ~/.config/inkscape/palettes/
pushd ~/.config/inkscape/palettes/

curl -O https://raw.githubusercontent.com/KiSSFLOW/gimp-material-design-color-palette/master/Material-Design.gpl

popd

echo "Changing screenshot destination folder..."
# Change screenshot destination folder
defaults write com.apple.screencapture location ~/Downloads
killall SystemUIServer

# Add jrnl symlink
ln -s -f ~/Dropbox/jrnl ~/.jrnl

# Load tmux plugins
echo "Remember to reload tmux plugins with 'prefix + I'"
tmux source-file ~/.tmux.conf
