if [[ ! "$(uname -s)" == "Darwin" ]]; then
  return
fi

# Load paths from /etc/paths.d
eval `/usr/libexec/path_helper -s`

# Notify to all GUI
launchctl setenv PATH "$PATH"
