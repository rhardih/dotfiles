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
