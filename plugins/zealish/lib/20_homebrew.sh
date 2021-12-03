# Disable build from source
export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1

path+=(
  # coreutils
  /usr/local/opt/coreutils/libexec/gnubin
  # homebrew
  /usr/local/sbin
)

# export MANPATH="/usr/local/man:$MANPATH"

# Shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"
