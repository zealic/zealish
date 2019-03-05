ZEALISH_LIB=$(dirname ${(%):-%x})

for script in $ZEALISH_LIB/lib/*.sh; do
  source $script
done

# Backups
BACKUP_DAYS=7
if [[ ! -f $ZEALISH/.backup ]]; then
  touch $ZEALISH/.backup
fi

_diff_epoch() {
  local currEpoch="$(date +'%s')"
  local lastEpoch="$(date -r $ZEALISH/.backup +'%s')"
  echo $(($(($currEpoch - $lastEpoch)) / 60 / 60 / 24))
}

if [[ `_diff_epoch` -gt $BACKUP_DAYS ]]; then
  for script in $ZEALISH_LIB/backup/*.sh; do
    echo "Backuping $(basename $script) ..."
    source $script
  done
  touch $ZEALISH/.backup
fi
