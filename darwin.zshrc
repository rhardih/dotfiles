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
