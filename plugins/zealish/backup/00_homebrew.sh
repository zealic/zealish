HOSTNAME=$(hostname)
BACKUP_DIR=$HOME/Dropbox/Workspace/$HOSTNAME

if [[ "$HOSTNAME" == "localhost" ]]; then
  return
fi

if [[ ! -d "$BACKUP_DIR" ]]; then
  mkdir -p "$BACKUP_DIR"
fi

brew leaves > $BACKUP_DIR/Homebrew.lst
brew cask list > $BACKUP_DIR/Homebrew-Caskroom.lst
