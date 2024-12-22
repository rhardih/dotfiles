#!/usr/bin/env bash

set -euo pipefail

# Install git if not present
if ! command -v git >/dev/null 2>&1; then
	echo "Installing git..."

	if command -v apt >/dev/null 2>&1; then
		sudo apt update
		sudo apt install -y git
	elif command -v dnf >/dev/null 2>&1; then
		sudo dnf install -y git
	elif command -v pacman >/dev/null 2>&1; then
		sudo pacman -S git
	else
		echo "Unable to determine package manager. Please install git manually."
		exit 1
	fi
fi

# Install Ansible if not present
if ! command -v ansible >/dev/null 2>&1; then
	echo "Installing Ansible..."

	if command -v apt >/dev/null 2>&1; then
		sudo apt update
		sudo apt install -y software-properties-common
		sudo add-apt-repository -y --update ppa:ansible/ansible
		sudo apt install -y ansible
	elif command -v dnf >/dev/null 2>&1; then
		sudo dnf install ansible
	elif command -v pacman >/dev/null 2>&1; then
		sudo pacman -S ansible
	else
		echo "Unable to determine package manager. Please install Ansible manually."
		exit 1
	fi
else
	echo "Ansible is already installed."
fi
