SOURCE_PROFILE_DIR="$HOME/Dropbox/Databox/Hosts"
DYNAMIC_PROFILE_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

if ! GOMPLATE_BIN=`which gomplate`; then
  echo "\e[33mWARN\e[0m: Initalize iTerm2 dynamic profiles failed, gomplate dosn't exists."
  return
fi

generate_iterm2_profiles() {
  local hosts_file=$1
  cat <<"EOF" | $GOMPLATE_BIN --datasource source=$hosts_file
{{- $source := (ds "source") }}
{{- $profiles := data.JSONArray "[]" }}
{{- range $i, $e := $source.hosts }}
  {{- $guid := print (conv.Join $source.tags "-") "-" $e.address }}
  {{- $port := "" }}
  {{- if (coll.Has $e "port") }}{{ $port = print "-p" $e.port " " }}{{ end }}
  {{- $user := "root" }}
  {{- if (coll.Has $e "user") }}{{ $user = $e.user }}{{ end }}
  {{- $command := printf "ssh %s%s@%s" $port $user $e.address }}
  {{- $profile := coll.Dict "Guid" $guid "Name" $e.name "Command" $command "Custom Command" "Yes" "Tags" $source.tags }}
  {{- $profiles = coll.Append $profile $profiles }}
{{- end }}
{{- $output := coll.Dict "Profiles" $profiles }}
{{- $output | data.ToJSONPretty "  " }}
EOF
}

# Regenerate
if [[ ! -d "${SOURCE_PROFILE_DIR}" || ! -d "${DYNAMIC_PROFILE_DIR}"  ]]; then
  return
fi
if [[ ! -f $ZEALISH/.iterm_hash ]]; then
  touch $ZEALISH/.iterm_hash
fi
if [[ "$(find $SOURCE_PROFILE_DIR -type f -print0 | sort -z | xargs -0 sha1sum | sha1sum)" == $(cat $ZEALISH/.iterm_hash) ]]; then
  return
else
  echo "\e[33mINFO\e[0m: iTerm2 dynamic profiles hash updated, generating..."
  # Delete legacy files
  rm -f $DYNAMIC_PROFILE_DIR/*.json
  for h in `ls "$SOURCE_PROFILE_DIR"`; do
    generate_iterm2_profiles $SOURCE_PROFILE_DIR/$h > "$DYNAMIC_PROFILE_DIR/`basename ${h%.*}`.json"
  done
fi
find $SOURCE_PROFILE_DIR -type f -print0 | sort -z | xargs -0 sha1sum | sha1sum > $ZEALISH/.iterm_hash
