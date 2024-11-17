# bun completions
[ -s "/Users/rene/.bun/_bun" ] && source "/Users/rene/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fzf
source <(fzf --zsh)

# Created by `pipx` on 2024-10-01 13:19:31
export PATH="$PATH:/Users/rene/.local/bin"

# pipx completions
autoload and run autoload:
autoload -U compinit && compinit

eval "$(register-python-argcomplete pipx)"

# psql

export PATH="/usr/local/opt/libpq/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/rene/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
