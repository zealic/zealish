BACKUP_DIR=$HOME/Dropbox/Workspace/$(hostname)

if [[ ! -d "$BACKUP_DIR" ]]; then
  mkdir -p "$BACKUP_DIR"
fi

if which masx 1>/dev/null; then
  echo "WARN: Need install mas : https://github.com/mas-cli/mas"
  return
fi

mas list > $BACKUP_DIR/AppStore.lst
