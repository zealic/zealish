GITCONFIG_USERS_DIR=~/.gitconfig.d/users

if [ ! -d $GITCONFIG_USERS_DIR ]; then
  mkdir -p $GITCONFIG_USERS_DIR 2>/dev/null
fi
git config --global user.useConfigOnly true
git config --global alias.set-user '!bash -c "git config include.path ~/.gitconfig.d/users/$1.conf" -'

