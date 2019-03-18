if [[ ! -z "$KUBECONFIG" ]]; then
  return
fi

DEFAULT_CONFIG=homelab
CONFIG_FILE=~/Dropbox/Workspace/kube/config-${DEFAULT_CONFIG}.yml
if [[ -f "$CONFIG_FILE" ]]; then
  export KUBECONFIG=$CONFIG_FILE
fi
