# bun completions
[ -s "/Users/rene/.bun/_bun" ] && source "/Users/rene/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fzf
source <(fzf --zsh)

# psql

export PATH="/usr/local/opt/libpq/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/rene/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# docker
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

# dotnet (Homebrew). Standalone apphosts / global tools (e.g. EasyDotnet, the
# server for easy-dotnet.nvim) don't go through the `dotnet` muxer, so they need
# DOTNET_ROOT to locate Homebrew's runtime.
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# BEGIN ASDF COMPLETIONS
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
# END ASDF COMPLETIONS
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# BEGIN asdf COMPLETIONS
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
# END asdf COMPLETIONS
. ~/.asdf/plugins/golang/set-env.zsh

export HOMEBREW_NO_AUTO_UPDATE=1
