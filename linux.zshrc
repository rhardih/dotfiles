# ssh
#
# Re-use ssh-agent between logins via systemd's socket-activated unit.
# Enable once with: systemctl --user enable --now ssh-agent.socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

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
