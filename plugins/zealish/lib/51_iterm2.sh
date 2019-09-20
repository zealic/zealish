SOURCE_PROFILE_DIR="$HOME/Dropbox/Databox/Hosts"
DYNAMIC_PROFILE_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

GOMPLATE_BIN=`which gomplate`
if [[ -z "${GOMPLATE_BIN}" ]]; then
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

if [[ ! -d "${SOURCE_PROFILE_DIR}" ]]; then
  return
fi
for h in `ls "$SOURCE_PROFILE_DIR"`; do
  generate_iterm2_profiles $SOURCE_PROFILE_DIR/$h > "$DYNAMIC_PROFILE_DIR/`basename ${h%.*}`.json"
done
