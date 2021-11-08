# Managing plugins as git submodules

Excerpt from:

http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen

## Install new plugin

```bash
cd ~/.dotfiles/.vim

git submodule add <repo url> pack/rhardih/start/<plugin-name>
```

E.g.

```bash
git submodule add http://github.com/tpope/vim-fugitive.git pack/rhardih/start/fugitive
```

### Updates docs

```bash
vim -u NONE -c "helptags pack/rhardih/start/<plugin-name>/doc" -c q
```

## Upgrading a plugin

```bash
# cd ~/.dotfiles/.vim/pack/rhardih/start/<plugin-name>
# git pull origin master
```

## Removing a plugin, e.g. vim-foo (old style bundles as example)

- Delete it from .gitmodules and `git add .gitmodules`
- Delete it from .git/config
- `git rm --cached .vim/bundle/vim-foo` (no trailing slash)
- `rm -rf .git/modules/.vim/bundle/vim-foo` (no trailing slash)
- `git commit -m "Removed submodule"`
- Delete the untracked submodule files `rm -rf .vim/bundle/vim-foo`
