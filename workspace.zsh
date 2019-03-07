WORKSPACE=~/Workspace
if [[ ! -z "$NO_WORKSPACE" ]]; then
  return
fi

# Already changed workdir
if [[ ! "$(pwd)" == "${HOME}" ]]; then
  return
fi

# Change workdir to workspace
if [[ -d "$WORKSPACE" ]]; then
  cd $WORKSPACE
fi
