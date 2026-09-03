# dotfiles

This is my personal collection of settings and hacks to make day to day life in
the commandline a little bit sweeter.

http://dotfiles.github.io/

## First run

1. Add an SSH key to your GitHub account first:
   https://github.com/settings/keys

2. Clone this repo (over SSH, so `origin` is push-ready right away):

   ```sh
   git clone git@github.com:rhardih/dotfiles.git ~/.dotfiles
   ```

3. Run the bootstrap:

   ```sh
   cd ~/.dotfiles && ./bootstrap.sh
   ```

The bootstrap is safe to re-run — it just re-applies the Ansible playbook
against the existing checkout.
