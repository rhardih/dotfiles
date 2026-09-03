# dotfiles

This is my personal collection of settings and hacks to make day to day life in
the commandline a little bit sweeter.

http://dotfiles.github.io/

## First run

**Prerequisite**: add an SSH key to your GitHub account first
(https://github.com/settings/keys). The bootstrap clones over SSH so that
`origin` is already push-ready — no anonymous HTTPS clone to re-point
afterwards.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/rhardih/dotfiles/HEAD/bootstrap.sh)"
```
