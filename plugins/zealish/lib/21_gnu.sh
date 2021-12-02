# coreutils
if [[ -f "/opt/homebrew/opt/coreutils/libexec/gnubin/readlink" ]]; then
  alias readlink /opt/homebrew/opt/coreutils/libexec/gnubin/readlink
fi

# grep
if [[ -f "/opt/homebrew/bin/ggrep" ]]; then
  alias grep=/opt/homebrew/bin/ggrep
fi
