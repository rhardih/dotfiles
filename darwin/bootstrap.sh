#!/usr/bin/env bash

export PATH=/usr/local/bin:$PATH

ruby -v

# Assume dotfiles was cloned to ~/.dotfiles
pushd $HOME

# Symlink dotfiles

dotfiles=(
  .bash_aliases
  .bash_profile
  .git-completion.bash
  .git-prompt.sh
  .gitconfig
  .gitignore
  .gitignore_global
  .gitmodules
  .gvimrc
  .rspec
  .tigrc
  .tmux
  .vim
  .vimrc
  .gdbinit
)

for dotfile in "${dotfiles[@]}"; do
  ln -s .dotfiles/$dotfile $dotfile
done


# tmux special case because of reattach-to-user-namespace
ln -s .dotfiles/darwin/.tmux.conf .tmux.conf

# .config for jrnl
ln -s .dotfiles/darwin/.config .config

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

pushd .dotfiles

# Install brews and casks
brew tap Homebrew/bundle
brew bundle

# Install crontab
echo 'Installing crontab, this might require security confirmation'
crontab ./crontab

popd

# Add Material Design colour palette to Inkscape
mkdir -p ~/.config/inkscape/palettes/
pushd ~/.config/inkscape/palettes/

curl -O https://raw.githubusercontent.com/KiSSFLOW/gimp-material-design-color-palette/master/Material-Design.gpl

popd

# Install rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

# Prep rbenv for immediate use
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Install latest version of ruby
ruby_version=$(curl https://www.ruby-lang.org/en/downloads/ | \
  grep "The current stable version is" | \
  sed -e "s/The current stable version is \(.*\).$"/\\1/g)

rbenv install $ruby_version
rbenv global $ruby_version
rbenv rehash
source ~/.bash_profile # to get the new ruby in PATH

# Initialise vim plugins
pushd .vim
git submodule init
git submodule update

# Compile C extension for command-t
pushd bundle/command-t/ruby/command-t/
ruby extconf.rb
make

echo "Changing screenshot destination folder..."
# Change screenshot destination folder
defaults write com.apple.screencapture location ~/Downloads
killall SystemUIServer

# Add jrnl symlink
ln -s ~/Dropbox/jrnl ~/.jrnl

# Load tmux plugins
echo "Remember to reload tmux plugins with 'prefix + I'"
tmux source-file ~/.tmux.conf

# pass
# Symlink only really makes sense after Cryptomator mounts, e.g.:
#
# ln -s /Volumes/GkYHTbHLQYzA_0/.password-store ~/.password-store
#
# Change the default pinentry mode, from ncurses "popup" to line mode prompt.
# Reason: If dismissed incorrectly the default would background the pinentry
# process and take up 100% CPU and also blocking new terminal spawns.
echo "pinentry-mode loopback" >> ~/.gnupg/gpg.conf

# change default shell from the old bundled version of bash, 3.2.57(1)-release
# on Mojave, to something newer, (~> 5.1.4(1)-release). This is to avoid errors
# with completion scripts. E.g. for pass:
#
#  $ pass<tab> -bash: compopt: command not found
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells' && sudo -k
chsh -s /usr/local/bin/bash
