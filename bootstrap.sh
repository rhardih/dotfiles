#!/usr/bin/env bash

set -euo pipefail

# Configuration
DOTFILES_REPO="https://github.com/rhardih/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
BRANCH="HEAD"

# Ensure we have a clean target directory
if [ -d "$DOTFILES_DIR" ]; then
	echo "Warning: $DOTFILES_DIR already exists!"
	read -p "Would you like to remove it? [y/N] " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		rm -rf "$DOTFILES_DIR"
	else
		echo "Aborting installation"
		exit 1
	fi
fi

# Detect OS and source appropriate script
case "$(uname -s)" in
Linux*)
	curl -fsSL "https://raw.githubusercontent.com/rhardih/dotfiles/${BRANCH}/bootstrap.linux.sh" | bash
	;;
Darwin*)
	curl -fsSL "https://raw.githubusercontent.com/rhardih/dotfiles/${BRANCH}/bootstrap.darwin.sh" | bash
	;;
*)
	echo "Unsupported system: $(uname -s)"
	exit 1
	;;
esac

# Clone dotfiles repository
git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
cd "$DOTFILES_DIR"

# Make sure community.general is installed
ansible-galaxy collection install community.general

# Run Ansible playbook
cd ansible
ansible-playbook --ask-become-pass bootstrap.yml

echo "Bootstrap complete! Please restart your shell."
