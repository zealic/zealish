ZEALISH_UPGRADE_DAYS=7

if [[ ! -f $ZEALISH/.update ]]; then
  touch $ZEALISH/.update
fi

_diff_epoch() {
  local currEpoch="$(date +'%s')"
  local lastEpoch="$(date -r $ZEALISH/.update +'%s')"
  echo $(($(($currEpoch - $lastEpoch)) / 60 / 60 / 24))
}

if [[ `_diff_epoch` -gt $ZEALISH_UPGRADE_DAYS ]]; then
  printf "${BLUE}%s${NORMAL}\n" "Updating Zealish"
  cd "$ZEALISH"
  git pull --rebase --stat origin master \
    && touch $ZEALISH/.update
fi
