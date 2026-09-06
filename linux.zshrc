# ssh
#
# Re-use ssh-agent between logins via systemd's socket-activated unit.
# Enable once with: systemctl --user enable --now ssh-agent.socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# The socket only lazily starts ssh-agent - it doesn't load any keys into
# it. Add ours once per agent lifetime (i.e. once per login/boot); ssh-add
# exits 0 once identities are already loaded, so this is a no-op on every
# shell after the first and won't re-prompt for the passphrase.
ssh-add -l >/dev/null 2>&1
if [[ $? -eq 1 ]]; then
  ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi

# snap bins
export PATH="/snap/bin:$PATH"

# nvim from pre-built archives
export PATH="$PATH:/opt/nvim-linux64/bin"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# BEGIN asdf COMPLETIONS
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
# END asdf COMPLETIONS
. ~/.asdf/plugins/golang/set-env.zsh
