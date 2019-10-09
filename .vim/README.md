# Managing plugins as git submodules

Excerpt from:

http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen

## Install new plugin

```bash
# cd ~/.dotfiles/.vim

# git submodule add <repo url> bundle/<bundle-name>
```

E.g.

```bash
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
```

## Upgrading a plugin

```bash
# cd ~/.dotfiles/.vim/bundle/<bundle-name>
# git pull origin master
```

## Removing a plugin, e.g. vim-foo

- Delete it from .gitmodules and `git add .gitmodules`
- Delete it from .git/config
- `git rm --cached .vim/bundle/vim-foo` (no trailing slash)
- `rm -rf .git/modules/.vim/bundle/vim-foo` (no trailing slash)
- `git commit -m "Removed submodule"`
- Delete the untracked submodule files `rm -rf .vim/bundle/vim-foo`
