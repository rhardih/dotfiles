#!/usr/bin/env bash

set -euo pipefail

# Install ansible

if ! command -v ansible &> /dev/null; then
	sudo apt update
	sudo apt install software-properties-common
	sudo add-apt-repository --yes --update ppa:ansible/ansible
	sudo apt install ansible
else
	echo "Ansible is already installed."
fi

pushd ansible 

ansible-playbook --ask-become-pass bootstrap.yml
