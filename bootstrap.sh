#!/usr/bin/env bash

set -euo pipefail

# Assumes this repo has already been cloned to ~/.dotfiles over SSH, e.g.:
#   git clone git@github.com:rhardih/dotfiles.git ~/.dotfiles
# (SSH so that `origin` is push-ready right away - see README)

DOTFILES_DIR="$HOME/.dotfiles"

if [ ! -d "$DOTFILES_DIR/.git" ]; then
	echo "Error: $DOTFILES_DIR is not a git repository."
	echo "Clone it first: git clone git@github.com:rhardih/dotfiles.git $DOTFILES_DIR"
	exit 1
fi

cd "$DOTFILES_DIR"

# Detect OS and run the appropriate script
case "$(uname -s)" in
Linux*)
	bash "$DOTFILES_DIR/bootstrap.linux.sh"
	;;
Darwin*)
	bash "$DOTFILES_DIR/bootstrap.darwin.sh"
	;;
*)
	echo "Unsupported system: $(uname -s)"
	exit 1
	;;
esac

# Make sure community.general is installed
ansible-galaxy collection install community.general

# Run Ansible playbook
cd ansible
ansible-playbook --ask-become-pass bootstrap.yml

echo "Bootstrap complete! Please restart your shell."
