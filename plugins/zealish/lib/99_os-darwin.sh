if [[ ! "$(uname -s)" == "Darwin" ]]; then
  return
fi

# Load paths from /etc/paths.d
eval `/usr/libexec/path_helper -s`

# Check configure path for System and User
if ! ps eww $$ | grep -o -e 'PATH=[^ ]*' | grep /usr/local/bin; then
  xpaths=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
  if [ -f /etc/paths ]; then
    xpaths=$(while read line; do
      echo -n "${line}:"
    done < /etc/paths)
    xpaths=$(echo "$xpaths" | sed 's|.$||g')
  fi
  cat <<EOF
Path '/usr/local/bin' not in system and user path, need run below command and reboot.
Otherwise some application can not working, eg. Alfred -> Eclipse
See also: https://tutel.me/c/apple/questions/51677/how+to+set+path+for+finderlaunched+applications

  > sudo launchctl config system path "$xpaths"
  > sudo launchctl config user path "$xpaths"
EOF
fi
