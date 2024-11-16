#!/usr/bin/env bash

set -euo pipefail

# Install Homebrew if not present
if ! command -v brew >/dev/null 2>&1; then
	echo "Installing Homebrew..."

  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

	# Add Homebrew to PATH for the current script
	eval "$(/usr/local/bin/brew shellenv)"
fi

# Install git if not present
if ! command -v git >/dev/null 2>&1; then
	echo "Installing git..."

	brew install git
fi

# Install Ansible if not present
if ! command -v ansible >/dev/null 2>&1; then
	echo "Installing Ansible..."

	brew install ansible
fi
